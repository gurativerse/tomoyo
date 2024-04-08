import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../theme.dart';
import '../shared/DefaultLayout.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return ProfileContent();
  }
}

class ProfileContent extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: AlignmentDirectional.centerStart,
            child: Text('Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Profile'),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(ColorPalatte.color['setting']!),
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                ClipOval(
                                  child: SizedBox.fromSize(
                                    size: Size.fromRadius(40),
                                    child: Image.asset('./asset/profile.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 25, right: 10),
                                  child: Text(user!.displayName.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.mode_edit_rounded,
                              color: Color(ColorPalatte.color['icon']!),
                            ),
                          ],
                        ))),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Text('Email'),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Container(
                  width: double.maxFinite,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(ColorPalatte.color['border']!),
                      ),
                    ),
                    child: Text(
                      user!.email.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Text('Password'),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: double.maxFinite,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(ColorPalatte.color['border']!),
                          ),
                        ),
                        child: Text(
                          "************",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'change password?',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
            )
          ]),
        ));
  }
}
