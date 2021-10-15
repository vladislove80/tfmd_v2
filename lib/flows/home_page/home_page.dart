import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Center(
        child: OutlinedButton(
          child: Text('GO BACK'),
          onPressed: () {},
        ),
      ),
    );
  }
}
