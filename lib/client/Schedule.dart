import 'package:flutter/material.dart';
import '../theme.dart';
import '../shared/AnimeCard.dart';
import '../shared/DefaultLayout.dart';
import 'package:intl/intl.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

String currentdate = DateFormat('EEEE').format(DateTime.now());

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  // SchedulePageContent createState() => SchedulePageContent();

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(pagecontent: SchedulePageContent(), Pageindex: 1);
  }
}

class DateWidget extends StatefulWidget {
  final Function(String) onDaySelected;

  DateWidget({required this.onDaySelected});

  @override
  DateWidgetContent createState() => DateWidgetContent();
}

class DateWidgetContent extends State<DateWidget> {
  String currentdate = DateFormat('EEEE').format(DateTime.now());
  Map<String, String> dayStates = {
    'MON': 'Monday',
    'TUE': 'Tuesday',
    'WED': 'Wednesday',
    'THU': 'Thursday',
    'FRI': 'Friday',
    'SAT': 'Saturday',
    'SUN': 'Sunday',
  };

  void updateText(String newdate) {
    setState(() {
      currentdate = newdate;
    });
    widget.onDaySelected(newdate);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var day in dayStates.keys)
          GestureDetector(
            onTap: () {
              updateText(dayStates[day]!);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              child: Text(
                day,
                style: TextStyle(
                  color: dayStates[day] == currentdate
                      ? Color(ColorPalatte.color['button']!)
                      : Colors.black,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class SchedulePageContent extends StatefulWidget {
  @override
  _SchedulePageContentState createState() => _SchedulePageContentState();
}

class _SchedulePageContentState extends State<SchedulePageContent> {
  String selectedDay = DateFormat('EEEE').format(DateTime.now());

  Future<List<dynamic>> fetchAnimeList(String day) async {
    final response =
        await http.get(Uri.parse('http://localhost:4000/v1/animes/calendar'));

    if (response.statusCode == 200) {
      List<dynamic> allAnimes = jsonDecode(response.body)['data'];
      return allAnimes.where((anime) => anime['airingDay'] == day).toList();
    } else {
      throw Exception('Failed to load anime calendar');
    }
  }

   void updateSelectedDay(String newDay) {
    setState(() {
      selectedDay = newDay;
    });
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
                  Container(
                    width: double.infinity,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.asset('./asset/reccommendex.png',
                        fit: BoxFit.cover),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  // Anime trend and see all
                  Container(
                    color: Color(ColorPalatte.color['line']!),
                    height: 1,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: DateWidget(onDaySelected: updateSelectedDay)),
                  Container(
                    color: Color(ColorPalatte.color['line']!),
                    height: 1,
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  // Anime list
                  FutureBuilder<List<dynamic>>(
                    future: fetchAnimeList(selectedDay),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      }

                      // Building the anime list dynamically based on the JSON response
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: (1 / (300 / 150)),
                        ),
                        controller: ScrollController(keepScrollOffset: false),
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          var anime = snapshot.data![index]['media'];
                          var coverImage = anime['coverImage']['extraLarge'];
                          return AnimeCard(
                            animeOriginalName: anime['jpName'],
                            animeEngName: anime['name'],
                            animePoster: coverImage,
                            availablePlatform: "Netflix",
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
