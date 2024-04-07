import 'package:flutter/material.dart';
import 'package:tomoyo/shared/AnimeCard.dart';

class Policy extends StatelessWidget {
  const Policy({super.key});
  @override
  Widget build(BuildContext context) {
    return PolicyContent();
  }
}

class PolicyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: AlignmentDirectional.centerStart,
            child: Text('Privacy Policy',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Text(
                  'We extend our sincere gratitude to Lect. Snit Sanghlao for his invaluable guidance and support throughout the conceptualization of our project. His expertise and insights have been instrumental in shaping our intention to develop an application aimed at locating all copyrighted Japanese anime in Thailand, accompanied by legitimate viewing channels. The prevalence of illegal anime viewership and the challenges associated with finding authorized platforms have been persistent issues and Lect.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.justify, 
                ),
              ],
            )));
  }
}
