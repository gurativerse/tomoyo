import 'package:flutter/material.dart';
import 'package:tomoyo/client/Home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tomoyo/theme.dart';

List<Map<String, String>> IntroInfo = [
  {
    "description": "THE MOST COMPLETE AND ROBUST ANIME INFORMATION CENTER",
    "image": "./asset/homepic.png",
  },
  {
    "description":
        "ONE STOP APPLICATION FOR FINDING LICENSED ANIME LISTS AND STREAMING PLATFORMS IN THAILAND",
    "image": "./asset/searchpic.png",
  },
  {
    "description":
        "ENJOY AND SUPPORT THE OFFICIAL LICENSED ANIME FROM THE LICENSORS EVERYDAY",
    "image": "./asset/schedulepic.png",
  },
];

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => IntroPageContent();
}

class IntroPageContent extends State<IntroPage> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFDFDFC),
          title: Image.asset('./asset/logo.png', height: 50),
        ),
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              children: [
                IntroPageTemplate(data: IntroInfo[0], finalPage: false),
                IntroPageTemplate(data: IntroInfo[1], finalPage: false),
                IntroPageTemplate(data: IntroInfo[2], finalPage: true),
              ],
            ),
            Container(
                alignment: Alignment(0, 0.9),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ColorTransitionEffect(
                    activeDotColor: Color(ColorPalatte.color['button']!),
                    dotColor: Color(ColorPalatte.color['line']!),
                  ),
                )),
          ],
        ));
  }
}

class IntroPageTemplate extends StatelessWidget {
  final Map<String, String> data;
  final bool finalPage;
  const IntroPageTemplate(
      {super.key, required this.data, required this.finalPage});

  Widget build(BuildContext context) {
    return (Column(
      children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 20)),
        Center(child: Image.asset(data['image'] ?? '', height: 500)),
        Padding(padding: EdgeInsets.symmetric(vertical: 20)),
        Container(
          width: 300,
          child: Text(
            data['description'] ?? '',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        if (finalPage)
          TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0XFFEA4958)),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Text(
                'JOIN US',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
      ],
    ));
  }
}
