import 'package:flutter/material.dart';
import '../theme.dart';

class DefaultLayout extends StatelessWidget {
  final Widget pagecontent;
  const DefaultLayout({required this.pagecontent});

  @override
  Widget build(BuildContext context) {
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
                      child: Text('guragura', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: pagecontent,
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
          showUnselectedLabels: true,
          selectedItemColor: Color(ColorPalatte.color['button']!),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
          unselectedItemColor: Color(ColorPalatte.color['border']!),
          unselectedLabelStyle: TextStyle(
              color: Color(ColorPalatte.color['border']!),
              fontWeight: FontWeight.w700)),
    );
  }
}
