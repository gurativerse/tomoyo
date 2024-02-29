import 'package:flutter/material.dart';
import '../theme.dart';
import '../shared/DefaultLayout.dart';

final String animedescdumb =
    'อิตาโดริ ยูจิ นักเรียนมัธยมปลายที่มีสมรรถภาพทางร่างกายสูง วันหนึ่งเขาได้กลืนนิ้วต้องคำสาปเข้าไป “นิ้วเทพอสูรเรียวเมนสุคุนะ” เพื่อช่วยรุ่นพี่จาก “วัตถุต้องคำสาป” ทำให้คำสาป “สุคุนะ”กลายเป็นส่วนหนึ่งของเขา หลังจากนั้นเขาก็ได้เข้าโรงเรียนไสยเวทย์ เพื่อทำให้คำพูดสุดท้ายของคุณปู่ “จงช่วยเหลือผู้อื่น” เป็นจริง ยูจิจึงไม่หยุดที่จะต่อสู้กับ “คำสาป”';

class AnimeInfoPage extends StatelessWidget {
  final String animeOriginalName;
  final String animeEngName;
  final String animePoster;
  final String availablePlatform;

  const AnimeInfoPage({
    Key? key,
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
      body: Expanded(
          child: SingleChildScrollView(
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
              child: Image.asset('./asset/animebg.png', fit: BoxFit.cover),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            AnimeInfoHeader(
                animeOriginalName: animeOriginalName,
                animeEngName: animeEngName,
                animePoster: animePoster,
                availablePlatform: availablePlatform),
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
                    animedescdumb,
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
      ))),
    );
  }
}

class AnimeInfoHeader extends StatelessWidget {
  final String animeOriginalName;
  final String animeEngName;
  final String animePoster;
  final String availablePlatform;

  const AnimeInfoHeader({
    Key? key,
    required this.animeOriginalName,
    required this.animeEngName,
    required this.animePoster,
    required this.availablePlatform,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          'TV',
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
                          'END',
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
                      'Oct 3, 2020 - Mar 27, 2021',
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
                      'Winter 2020',
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
  }
}
