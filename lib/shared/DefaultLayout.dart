import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tomoyo/client/Home.dart';
import 'package:tomoyo/client/More.dart';
import 'package:tomoyo/client/Schedule.dart';
import 'package:tomoyo/client/Search.dart';
import '../theme.dart';

class DefaultLayout extends StatefulWidget {
  final Widget pagecontent;
  final int Pageindex;
  const DefaultLayout({required this.pagecontent, required this.Pageindex});

  @override
  DefaultLayoutState createState() => DefaultLayoutState();
}

class DefaultLayoutState extends State<DefaultLayout> {
  late int currentIndex;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.Pageindex;
  }

  @override
  Widget build(BuildContext context) {
    void NavState(int index) {
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => HomePage(),
            transitionDuration: const Duration(seconds: 0),
          ),
        );
      } else if (index == 1) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => SchedulePage(),
            transitionDuration: const Duration(seconds: 0),
          ),
        );
      } else if (index == 2) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => SearchPage(),
            transitionDuration: const Duration(seconds: 0),
          ),
        );
      } else if (index == 3) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => MorePage(),
            transitionDuration: const Duration(seconds: 0),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "./asset/logo.png",
                height: 40,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(15), // Image radius
                        child: Image.asset('./asset/profile.png',
                            fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(user!.displayName.toString(), style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: widget.pagecontent,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: "SCHEDULE",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "SEARCH",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "MORE",
          )
        ],
        currentIndex: currentIndex,
        showUnselectedLabels: true,
        selectedItemColor: Color(ColorPalatte.color['button']!),
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
        unselectedItemColor: Color(ColorPalatte.color['border']!),
        unselectedLabelStyle: TextStyle(
            color: Color(ColorPalatte.color['border']!),
            fontWeight: FontWeight.w700,
            fontSize: 12),
        onTap: NavState,
      ),
    );
  }
}
