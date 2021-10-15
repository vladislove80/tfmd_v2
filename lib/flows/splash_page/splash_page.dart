import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tfmd_v2/common/app_string.dart';
import 'package:tfmd_v2/common/resources.dart';
import 'package:tfmd_v2/flows/home_page/home_page.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splash';

  SplashPage();

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _goToHomePageWithDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              Resources.splashImage,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            child: Text(
              AppString.splashText,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.white,
                  ),
            ),
            bottom: 40,
          )
        ],
      ),
    );
  }

  void _goToHomePageWithDelay() => new Future.delayed(
        const Duration(seconds: 4),
        () => Navigator.of(context)
          ..pop()
          ..pushNamed(HomePage.routeName),
      );
}
