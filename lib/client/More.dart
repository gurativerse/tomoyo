import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tomoyo/client/Favourite.dart';
import 'package:tomoyo/client/Login.dart';
import 'package:tomoyo/client/Policy.dart';
import 'package:tomoyo/client/Profile.dart';
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
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Account'),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Profile()));
                          },
                          child: Container(
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(ColorPalatte.color['setting']!),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          ClipOval(
                                            child: SizedBox.fromSize(
                                              size: const Size.fromRadius(25),
                                              child: Image.asset(
                                                  './asset/profile.png',
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 25),
                                            child: Text(user!.displayName.toString(),
                                                style: const TextStyle(
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
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Favourite()));
                      },
                      child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(ColorPalatte.color['setting']!),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('My Favourite',
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(ColorPalatte.color['icon']!),
                                  ),
                                ],
                              )))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Option'),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(ColorPalatte.color['setting']!),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Content Language',
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
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Policy()));
                      },
                      child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(ColorPalatte.color['setting']!),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Privacy Policy',
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(ColorPalatte.color['icon']!),
                                  ),
                                ],
                              )))),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(const Color(0XFFEA4958)),
                    ),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Padding(
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
