import 'package:flutter/material.dart';
import 'package:tomoyo/theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerScreen extends StatefulWidget {
  final String videolink;

  const YouTubePlayerScreen({
    Key? key,
    required this.videolink,
  }) : super(key: key);

  @override
  _YouTubePlayerScreenState createState() => _YouTubePlayerScreenState();
}

class _YouTubePlayerScreenState extends State<YouTubePlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _extractVideoId(widget.videolink),
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Color(ColorPalatte.color['button']!),
        ),
      ),
    );
  }

  String _extractVideoId(String videoLink) {
    RegExp regExp = RegExp(
        r'(?<=youtu.be/|watch\?v=|/videos/|embed\/|youtu\.be\/|v\/|e\/|u\/\w+\/|v=)([^\#\&\?\n]+)');
    Match? match = regExp.firstMatch(videoLink);

    if (match != null && match.groupCount >= 1) {
      return match.group(1)!;
    } else {
      return 'NO TRAILER';
    }
  }
}
