import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tomoyo/shared/AnimeCard.dart';
import '../theme.dart';
import '../shared/DefaultLayout.dart';
import 'package:http/http.dart' as http;

class Favourite extends StatelessWidget {
  const Favourite({super.key});
  @override
  Widget build(BuildContext context) {
    return FavouriteContent();
  }
}

class FavouriteContent extends StatefulWidget {
  // ignore: non_constant_identifier_names
  @override
  _FavouriteContentState createState() => _FavouriteContentState();
}

class _FavouriteContentState extends State<FavouriteContent> {

  List favoriteResults = [];
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

  Future<void> favoriteAnimeInfo() async {
    setState(() {
      _isLoading = true;
    });

    User? user = FirebaseAuth.instance.currentUser;

    final uid = user!.uid;

    final apiUrl = dotenv.env['API_URL'];
    final response =
        await http.get(Uri.parse('$apiUrl/v1/user/anime/list/$uid'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final ids = data['animeList'] as List<dynamic>;

      final detailsFutures = ids.map((id) => fetchAnimeInfo(id)).toList();
      final detailsResults = await Future.wait(detailsFutures);

      setState(() {
        favoriteResults = detailsResults;
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
  void initState() {
    super.initState();
    favoriteAnimeInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: AlignmentDirectional.centerStart,
            child: const Text('My Favourite',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        body: Column(
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          if (_isLoading) 
            const Center(child: CircularProgressIndicator())
            else 
            GridView.count(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    childAspectRatio: (1 / (300 / 145)),
                    controller: ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    children: favoriteResults.map((animeData) {
                      return AnimeCard(
                        animeId: animeData['id'],
                        animeOriginalName: animeData['title']['native'],
                        animeEngName: animeData['title']['userPreferred'],
                        animePoster: animeData['coverImage']['extraLarge'],
                      );
                    }).toList(),
                  )
          ],
        ));
  }
}
