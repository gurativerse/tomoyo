import 'package:flutter/material.dart';
import '../theme.dart';
import 'animeinfo.dart';
import '../shared/DefaultLayout.dart';

List<Map<String, String>> animeList = [
  {
    "animeOriginalName": "呪術廻戦",
    "animeEngName": "Jujutsu Kaisen",
    "animePoster": "https://m1r.ai/9/r35vt.jpg",
    "availablePlatform": "netflix",
  },
  {
    "animeOriginalName": "Solo leveling",
    "animeEngName": "Solo leveling",
    "animePoster": "https://m1r.ai/9/2r5yx.jpg",
    "availablePlatform": "netflix",
  },
  {
    "animeOriginalName": "ワンピース",
    "animeEngName": "One Piece",
    "animePoster": "https://m1r.ai/9/mm3nu.jpg",
    "availablePlatform": "netflix",
  },
  {
    "animeOriginalName": "ハウルの動く城",
    "animeEngName": "Howl‘s Moving Castle",
    "animePoster": "https://m1r.ai/9/mwp95.jpg",
    "availablePlatform": "netflix",
  },
  {
    "animeOriginalName": "となりのトトロ",
    "animeEngName": "My Neighbor Totoro",
    "animePoster": "https://m1r.ai/9/h8jza.jpg",
    "availablePlatform": "netflix",
  },
  {
    "animeOriginalName": "君に届け",
    "animeEngName": "Kimi ni Todoke",
    "animePoster": "https://m1r.ai/9/qidxj.jpg",
    "availablePlatform": "netflix",
  },
  {
    "animeOriginalName": "転生したらスライムだった件",
    "animeEngName": "That Time I Got Reincarnated as a Slime",
    "animePoster": "https://m1r.ai/9/njb0k.jpg",
    "availablePlatform": "netflix",
  },
  {
    "animeOriginalName": "ようこそ実力至上主義の教室へ ",
    "animeEngName": "Classroom of the Elite Season",
    "animePoster": "https://m1r.ai/9/4w17f.jpg",
    "availablePlatform": "netflix",
  },
  {
    "animeOriginalName": "マッシュル-MASHLE- 神覚者候補選抜試験編",
    "animeEngName": "MASHLE: MAGIC AND MUSCLES",
    "animePoster":
        "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx166610-IjJ8YLOKsua4.jpg",
    "availablePlatform": "netflix",
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(pagecontent: HomePageContent());
  }
}

class HomePageContent extends StatelessWidget {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
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
                      ),
                      Text(
                        'see all',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(ColorPalatte.color['link']!),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  // Anime list
                  GridView.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    childAspectRatio: (1 / (300 / 150)),
                    controller: ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    children: List.generate(
                      animeList.length,
                      (index) => AnimeCard(
                        animeOriginalName: animeList[index]
                            ["animeOriginalName"]!,
                        animeEngName: animeList[index]["animeEngName"]!,
                        animePoster: animeList[index]["animePoster"]!,
                        availablePlatform: animeList[index]
                            ["availablePlatform"]!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //footer
        Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
            color: Color(0xFFE7E5E4),
            width: 2.0,
          ))),
          height: 80.0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Add this to center the column content vertically
                  children: [
                    Image.asset("./asset/onhome.png", height: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'HOME',
                        style: TextStyle(
                          color: Color(ColorPalatte.color['button']!),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("./asset/schedule.png", height: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'SCHEDULE',
                        style: TextStyle(
                          color: Color(ColorPalatte.color['border']!),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("./asset/search.png", height: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'SEARCH',
                        style: TextStyle(
                          color: Color(ColorPalatte.color['border']!),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("./asset/more.png", height: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'MORE',
                        style: TextStyle(
                          color: Color(ColorPalatte.color['border']!),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AnimeCard extends StatelessWidget {
  final String animeOriginalName;
  final String animeEngName;
  final String animePoster;
  final String availablePlatform;

  const AnimeCard({
    Key? key,
    required this.animeOriginalName,
    required this.animeEngName,
    required this.animePoster,
    required this.availablePlatform,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AnimeInfoPage(
                        animeOriginalName: animeOriginalName,
                        animeEngName: animeEngName,
                        animePoster: animePoster,
                        availablePlatform: availablePlatform,
                      )));
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(animePoster),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('./asset/$availablePlatform.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  strutStyle: StrutStyle(fontSize: 12.0),
                  text: TextSpan(
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(ColorPalatte.color['shadow']!),
                      ),
                      text: animeOriginalName),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  strutStyle: StrutStyle(fontSize: 12.0),
                  text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      text: animeEngName),
                ),
              ),
            ],
          ),
        ));
  }
}
