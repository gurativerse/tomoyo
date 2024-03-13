import 'package:flutter/material.dart';
import '../theme.dart';
import '../client/AnimeInfo.dart';

class AnimeCard extends StatelessWidget {
  final String animeId;
  final String animeOriginalName;
  final String animeEngName;
  final String animePoster;
  final String availablePlatform;

  const AnimeCard({
    Key? key,
    required this.animeId,
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
                        animeId: animeId,
                        animeOriginalName: animeOriginalName,
                        animeEngName: animeEngName,
                        animePoster: animePoster,
                        availablePlatform: availablePlatform,
                      )));
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          color: Color(ColorPalatte.color['card']!),
          child: Row(
            children: [
              SizedBox(width: 10),
              Container(
                width: 120,
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(animePoster),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        animeEngName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        animeOriginalName,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(ColorPalatte.color['shadow']!),
                        ),
                      ),
                      SizedBox(height: 5),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        strutStyle: StrutStyle(fontSize: 10.0),
                        maxLines: 5,
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.w200),
                          text:
                              'อิตาโดริ ยูจิ นักเรียนมัธยมปลายที่มีสมรรถภาพทางร่างกายสูง วันหนึ่งเขาได้กลืนนิ้วต้องคำสาปเข้าไป “นิ้วเทพอสูรเรียวเมนสุคุนะ” เพื่อช่วยรุ่นพี่จาก “วัตถุต้องคำสาป” ทำให้คำสาป “สุคุนะ”กลายเป็นส่วนหนึ่งของเขา หลังจากนั้นเขาก็ได้เข้าโรงเรียนไสยเวทย์ เพื่อทำให้คำพูดสุดท้ายของคุณปู่ “จงช่วยเหลือผู้อื่น” เป็นจริง ยูจิจึงไม่หยุดที่จะต่อสู้กับ “คำสาป”',
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'asset/netflix.png',
                            width: 30,
                          ),
                          Image.asset(
                            'asset/billibilli.png',
                            width: 30,
                          ),
                          Image.asset(
                            'asset/wetv.png',
                            width: 30,
                          ),
                          TextButton(
                            style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(Size(20, 6)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(ColorPalatte.color['button']!)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'More',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
