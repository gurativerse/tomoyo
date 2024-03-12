import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../theme.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchAnimeId(animeId) async {
  final response = await http.get(
      Uri.parse('https://tomoyo-api.30052565.xyz/v1/animes/info/$animeId'));

  if (response.statusCode == 200) {
    return jsonDecode(
        response.body)['data']; // Assuming 'data' contains the anime info
  } else {
    throw Exception('Failed to load anime info');
  }
}

class AnimeInfoPage extends StatelessWidget {
  final int animeId;
  final String animeOriginalName;
  final String animeEngName;
  final String animePoster;
  final String availablePlatform;

  const AnimeInfoPage({
    Key? key,
    required this.animeId,
    required this.animeOriginalName,
    required this.animeEngName,
    required this.animePoster,
    required this.availablePlatform,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchAnimeId(animeId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Assuming the snapshot.data contains the anime info
            final animeData = snapshot.data!;

            final animeDescription = animeData['description']
                .replaceAll("<br>", "")
                .replaceAll("\\n", "")
                .replaceAll("<i>", "")
                .replaceAll("</i>", "");

            return SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child:
                          // Image.asset('./asset/animebg.png', fit: BoxFit.cover),
                          Image(
                              image: NetworkImage(animeData['bannerImage']),
                              fit: BoxFit.cover)),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  AnimeInfoHeader(
                      animeId: animeData['id'],
                      animeOriginalName: animeData['title']['native'],
                      animeEngName: animeData['title']['english'],
                      animePoster: animeData['coverImage']['extraLarge'],
                      availablePlatform: 'netflix',
                      status: animeData['status'],
                      genre: animeData['genres'][0],
                      startDate: animeData['startDate'],
                      endDate: animeData['endDate'],
                      season: animeData['season'],
                      seasonYear: animeData['seasonYear'],
                      bannerImage: animeData['bannerImage']),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Short Description',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Text(
                          animeDescription,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 15)),
                        Text(
                          'Trailer',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Container(
                          width: double.infinity,
                          height: 200,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                          // child: Image.asset('./asset/reccommendex.png',
                          //     fit: BoxFit.cover),
                        ),
                        Padding(padding: EdgeInsets.only(top: 15)),
                        Text(
                          'Episodes',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                                width: double.infinity,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(animePoster),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        bottom: 10,
                                        left: 20,
                                        child: Text(
                                          'Episode 1',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                )),
                            Padding(padding: EdgeInsets.only(top: 5)),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 15)),
                        Text(
                          'Related anime',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        //anime card
                      ],
                    ),
                  )
                ],
              ),
            ));
          }
        },
      ),
    );
  }
}

class AnimeInfoHeader extends StatelessWidget {
  final int animeId;
  final String animeOriginalName;
  final String animeEngName;
  final String animePoster;
  final String availablePlatform;
  final String status;
  final String genre;
  final startDate;
  final endDate;
  final String season;
  final String seasonYear;
  final String bannerImage;

  const AnimeInfoHeader(
      {Key? key,
      required this.animeId,
      required this.animeOriginalName,
      required this.animeEngName,
      required this.animePoster,
      required this.availablePlatform,
      required this.status,
      required this.genre,
      required this.season,
      required this.seasonYear,
      required this.bannerImage,
      this.startDate,
      this.endDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: fetchAnimeId(animeId),
        builder: (context, snapshot) {
          var formattedDateRange;
          if (startDate == null ||
              endDate == null ||
              startDate['year'] == null ||
              startDate['month'] == null ||
              startDate['day'] == null ||
              endDate['year'] == null ||
              endDate['month'] == null ||
              endDate['day'] == null) {
            formattedDateRange = "Not Specified";
          } else {
            final DateTime startDateTime = DateTime(
              startDate['year'],
              startDate['month'],
              startDate['day'],
            );
            final DateTime endDateTime = DateTime(
              endDate['year'],
              endDate['month'],
              endDate['day'],
            );

            // Format the DateTime objects to a string
            final String formattedStartDate =
                DateFormat('MMM d, yyyy').format(startDateTime);
            final String formattedEndDate =
                DateFormat('MMM d, yyyy').format(endDateTime);

            // Combine both dates into a single string
            formattedDateRange = '$formattedStartDate - $formattedEndDate';
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(animePoster, fit: BoxFit.cover),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.1, 0)),
                    child: Row(
                      children: [
                        Icon(Icons.add_circle, color: Colors.black, size: 14),
                        SizedBox(width: 2),
                        Text(
                          'add to your favourite',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 20)),
              Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        strutStyle: StrutStyle(fontSize: 12.0),
                        textAlign: TextAlign.left,
                        softWrap: true,
                        maxLines: 2,
                        text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            text: animeEngName),
                      ),
                      SizedBox(height: 2),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        strutStyle: StrutStyle(fontSize: 12.0),
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: TextStyle(
                            color: Color(ColorPalatte.color['shadow']!),
                            fontSize: 12,
                          ),
                          text: animeOriginalName,
                        ),
                      ),
                      SizedBox(height: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Airing',
                            style: TextStyle(
                              color: Color(ColorPalatte.color['shadow']!),
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Finished Airing',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Genre',
                                style: TextStyle(
                                  color: Color(ColorPalatte.color['shadow']!),
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                genre,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Status',
                                style: TextStyle(
                                  color: Color(ColorPalatte.color['shadow']!),
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                status,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Original run',
                            style: TextStyle(
                              color: Color(ColorPalatte.color['shadow']!),
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            formattedDateRange,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Season',
                            style: TextStyle(
                              color: Color(ColorPalatte.color['shadow']!),
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '$season $seasonYear',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          );
        });
  }
}
