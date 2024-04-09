import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../theme.dart';
import '../shared/DefaultLayout.dart';
import '../shared/SearchCard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(pagecontent: SearchPageContent(), Pageindex: 2);
  }
}

class SearchPageContent extends StatefulWidget {
  @override
  _SearchPageContentState createState() => _SearchPageContentState();
}

class _SearchPageContentState extends State<SearchPageContent> {
  List searchResults = [];
  TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  Future<Map<String, dynamic>> fetchAnimeInfo(animeId) async {
    final apiUrl = dotenv.env['API_URL'];
    final response =
        await http.get(Uri.parse('$apiUrl/v1/animes/info/$animeId'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Failed to load anime info');
    }
  }

  Future<void> searchAnime(query) async {
    setState(() {
      _isLoading = true;
    });

    final apiUrl = dotenv.env['API_URL'];
    final response =
        await http.get(Uri.parse('$apiUrl/v1/animes/search/$query'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final ids = data['data'] as List<dynamic>;

      final detailsFutures = ids.map((id) => fetchAnimeInfo(id)).toList();
      final detailsResults = await Future.wait(detailsFutures);

      setState(() {
        searchResults = detailsResults;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to load anime info');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
                child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 280,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0XFFD7D3D0)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        height: 40, // Adjust height as needed
                        width: 40, // Adjust width as needed
                        decoration: BoxDecoration(
                          color: Color(ColorPalatte.color['button']!),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () => searchAnime(_controller.text),
                          child: Icon(Icons.manage_search, color: Colors.white),
                        ),
                      )),
                ],
              ),
              if (_isLoading) // Display loading indicator when searching
                Center(
                  child: CircularProgressIndicator(),
                )
              else
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, left: 12),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 12, color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'result from searching anime ',
                          ),
                          TextSpan(
                            text: searchResults.length.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' series',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Column(
                children: searchResults.map((anime) {
                  return SearchCard(
                    animeId: anime['id'],
                    animeEngName: anime['title']['english'] ??
                        anime['title']['romaji'].toString(),
                    animeOriginalName: anime['title']['native']?.toString() ??
                        anime['title']['romaji'].toString(),
                    animePoster: anime['coverImage']['large'].toString(),
                    animeDescription: anime['description'].toString(),
                  );
                }).toList(),
              ),
            ],
          ),
        )))
      ],
    );
  }
}
