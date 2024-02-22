import 'package:flutter/material.dart';
import 'package:tomoyo/client/Login.dart';
import '../theme.dart';
import '../shared/DefaultLayout.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(pagecontent: MorePageContent(), Pageindex: 3);
  }
}

class MorePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Account'),
                      Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(ColorPalatte.color['setting']!),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          ClipOval(
                                            child: SizedBox.fromSize(
                                              size: Size.fromRadius(25),
                                              child: Image.asset(
                                                  './asset/profile.png',
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 25),
                                            child: Text('guragura',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color:
                                            Color(ColorPalatte.color['icon']!),
                                      ),
                                    ],
                                  )))),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 8)),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(ColorPalatte.color['setting']!),
                          ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('My favourite',
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(ColorPalatte.color['icon']!),
                                  ),
                                ],
                              )))),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Option'),
                      Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(ColorPalatte.color['setting']!),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Content Language',
                                          style: TextStyle(
                                            fontSize: 16,
                                          )),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color:
                                            Color(ColorPalatte.color['icon']!),
                                      ),
                                    ],
                                  )))),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 8)),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(ColorPalatte.color['setting']!),
                          ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Privacy Policy',
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(ColorPalatte.color['icon']!),
                                  ),
                                ],
                              )))),
                  Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0XFFEA4958)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      child: Text(
                        'LOG OUT',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              )),
        )),
      ],
    );
  }
}
