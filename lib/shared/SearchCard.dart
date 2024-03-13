import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import '../theme.dart';
import '../client/AnimeInfo.dart';

class SearchCard extends StatelessWidget {
  final animeId;
  final String animeOriginalName;
  final String animeEngName;
  final String animePoster;
  final String availablePlatform;
  final String animeDescription;
  final List lc;

  const SearchCard(
      {Key? key,
      required this.animeId,
      required this.animeOriginalName,
      required this.animeEngName,
      required this.animePoster,
      required this.availablePlatform,
      required this.animeDescription,
      required this.lc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var description = animeDescription
        .toString()
        .replaceAll("<br>", "")
        .replaceAll("\\n", "")
        .replaceAll("<i>", "")
        .replaceAll("</i>", "");

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
                          text: description,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.network(
                              lc[0]['icon'].toString(),
                              width: 30,
                            ), // Or Image.asset for local assets
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
