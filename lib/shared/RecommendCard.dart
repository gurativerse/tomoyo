import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tomoyo/client/AnimeInfo.dart';
// Assuming 'theme.dart' exists and provides a theme for your app
import 'package:tomoyo/theme.dart';

class RecommendCard extends StatelessWidget {
  const RecommendCard({Key? key}) : super(key: key);

  Future<Map<String, dynamic>> fetchRecommendAnime() async {
    final apiUrl = dotenv.env['API_URL'];
    final response = await http.get(Uri.parse('$apiUrl/v1/animes/featured'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load anime list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: fetchRecommendAnime(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          var data = snapshot.data?['data'];
          var bannerImageUrl = data['bannerImage'] ?? '';
          var animeTitle = data['title']['userPreferred'] ?? 'Unknown Title';
          var nextAiringTimestamp = data['nextAiringEpisode']['airingAt'];
          DateTime nextAiringDate =
              DateTime.fromMillisecondsSinceEpoch(nextAiringTimestamp * 1000);

          return InkWell(
            onTap: () {},
            child: Container(
            width: double.infinity,
            height: 120,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(bannerImageUrl, fit: BoxFit.cover),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2), // 20% opacity
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CountdownTimer(nextAiringDate: nextAiringDate),
                ),
                Positioned(
                  bottom: 8,
                  left: 16,
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    strutStyle: StrutStyle(fontSize: 12.0),
                    text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        text: animeTitle),
                  ),
                ),
              ],
            ),
          ),
          );
        }
      },
    );
  }
}

class CountdownTimer extends StatefulWidget {
  final DateTime nextAiringDate;

  const CountdownTimer({Key? key, required this.nextAiringDate})
      : super(key: key);

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer? _timer;
  Duration _timeLeft = Duration();

  void _startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      final now = DateTime.now();
      final difference = widget.nextAiringDate.difference(now);
      if (difference.isNegative) {
        _timer?.cancel();
      } else {
        setState(() {
          _timeLeft = difference;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      strutStyle: StrutStyle(fontSize: 30.0),
      textAlign: TextAlign.justify,
      text: TextSpan(
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          text:
              '${_timeLeft.inDays}d ${_timeLeft.inHours % 24}h ${_timeLeft.inMinutes % 60}m ${_timeLeft.inSeconds % 60}s'),
    );
  }
}
