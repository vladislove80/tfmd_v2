import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tfmd_v2/flows/home_page/home_page.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: OutlinedButton(
          child: Text('GO NEXT'),
          onPressed: () {
            Navigator.of(context).pushNamed(HomePage.routeName);
          },
        ),
      ),
    );
  }
}
