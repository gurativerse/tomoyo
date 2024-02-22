import 'package:flutter/material.dart';
import '../theme.dart';
import '../shared/DefaultLayout.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(pagecontent: SearchPageContent(), Pageindex: 2);
  }
}

class SearchPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 280,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0XFFD7D3D0)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0XFFEA4958)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Icon(
                              Icons.manage_search,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          )),
        ),
      ],
    );
  }
}
