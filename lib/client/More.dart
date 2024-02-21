import 'package:flutter/material.dart';
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
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  // Recommend
                  Container(
                    width: double.infinity,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.asset('./asset/reccommendex.png',
                        fit: BoxFit.cover),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
