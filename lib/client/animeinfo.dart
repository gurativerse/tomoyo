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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Image.asset('./asset/animebg.png', fit: BoxFit.cover),
                ),
                Positioned(
                    top: 110,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child:
                                  Image.network(animePoster, fit: BoxFit.cover),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.1,
                                    0)),
                            child: Row(
                              children: [
                                Icon(Icons.add_circle,
                                    color: Colors.black, size: 14),
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
                    )),
              ],
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                strutStyle: StrutStyle(fontSize: 12.0),
                                text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    text: animeEngName),
                              ),
                              SizedBox(width: 5),
                               Flexible(
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1, // Set maxLines to 1
                                  strutStyle: StrutStyle(fontSize: 12.0),
                                  text: TextSpan(
                                    style: TextStyle(
                                      color:
                                          Color(ColorPalatte.color['shadow']!),
                                      fontSize: 12,
                                    ),
                                    text: animeOriginalName,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Text(
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w200),
                                animedescdumb),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Row(
                              children: [
                                
                              ],
                            )
                          ),
                        ],
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
