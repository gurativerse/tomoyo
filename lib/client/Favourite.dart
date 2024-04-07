import 'package:flutter/material.dart';
import 'package:tomoyo/shared/AnimeCard.dart';
import '../theme.dart';
import '../shared/DefaultLayout.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});
  @override
  Widget build(BuildContext context) {
    return FavouriteContent();
  }
}

class FavouriteContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: AlignmentDirectional.centerStart,
            child: Text('My Favourite',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        body: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            // Anime list
            // FutureBuilder(
            //   future: _animeList,
            //   builder: (context, snapshot) {
            //     if (snapshot.hasError) {
            //       return Text('Error: ${snapshot.error}');
            //     } else if (snapshot.hasData) {
            //       final animeList = snapshot.data as List<dynamic>;
            //       return GridView.count(
            //         crossAxisSpacing: 5,
            //         mainAxisSpacing: 10,
            //         crossAxisCount: 3,
            //         childAspectRatio: (1 / (300 / 145)),
            //         controller: ScrollController(keepScrollOffset: false),
            //         shrinkWrap: true,
            //         children: animeList.map((animeData) {
            //           return AnimeCard(
            //             animeId: animeData['id'],
            //             animeOriginalName: animeData['jpName'],
            //             animeEngName: animeData['name'],
            //             animePoster: animeData['coverImage']['extraLarge'],
            //             availablePlatform: 'netflix',
            //           );
            //         }).toList(),
            //       );
            //     } else {
            //       return const CircularProgressIndicator();
            //     }
            //   },
            // )
          ],
        ));
  }
}
