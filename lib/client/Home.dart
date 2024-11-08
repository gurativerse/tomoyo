import 'package:flutter/material.dart';
import 'package:tomoyo/shared/RecommendCard.dart';
import '../shared/AnimeCard.dart';
import '../shared/DefaultLayout.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<List<dynamic>> fetchAnimeList() async {
  final apiUrl = dotenv.env['API_URL'];
  final response = await http.get(Uri.parse('$apiUrl/v1/animes/seasonal'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['data'];
  } else {
    throw Exception('Failed to load anime list');
  }
}

Future<Map<String, dynamic>> fetchRecommendAnime() async {
  final apiUrl = dotenv.env['API_URL'];
  final response = await http.get(Uri.parse('$apiUrl/v1/animes/featured'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['data'];
  } else {
    throw Exception('Failed to load anime list');
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(pagecontent: HomePageContent(), Pageindex: 0);
  }
}

class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  late Future<List<dynamic>> _animeList;
  late Future<Map<String, dynamic>> _recommendList;

  @override
  void initState() {
    super.initState();
    _animeList = fetchAnimeList();
    _recommendList = fetchRecommendAnime();
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
                children: [
                  // Recommend
                  RecommendCard(),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  // Anime trend and see all
                  Row(
                    children: [
                      Image.asset('./asset/trend.png'),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Anime Trend',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  // Anime list
                  FutureBuilder(
                    future: _animeList,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final animeList = snapshot.data as List<dynamic>;
                        return GridView.count(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 10,
                          crossAxisCount: 3,
                          childAspectRatio: (1 / (300 / 145)),
                          controller: ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          children: animeList.map((animeData) {
                            return AnimeCard(
                              animeId: animeData['id'] ?? 0,
                              animeOriginalName: animeData['jpName'] ?? '',
                              animeEngName: animeData['name'] ?? '',
                              animePoster:
                                  animeData['coverImage']['extraLarge'] ?? '',
                            );
                          }).toList(),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
