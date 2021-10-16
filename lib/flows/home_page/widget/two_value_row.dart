import 'package:flutter/material.dart';

class TwoValueRow extends StatelessWidget {
  final String firstLabel;
  final String firstValue;
  final String secondLabel;
  final String secondValue;

  TwoValueRow({
    required this.firstLabel,
    required this.firstValue,
    required this.secondLabel,
    required this.secondValue,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Theme.of(context).primaryColorDark.withOpacity(0.7),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '$firstLabel$firstValue',
          style: textStyle,
        ),
        Text(
          '$secondLabel$secondValue',
          style: textStyle,
        ),
      ],
    );
  }
}
