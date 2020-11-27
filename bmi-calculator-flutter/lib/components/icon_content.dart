import 'package:flutter/material.dart';
import '../constants.dart';
class iconContent extends StatelessWidget {

  final IconData userIcon;
  final String label;
  iconContent({this.userIcon,this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          userIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style:klabelTextSyle,

        ),
      ],
    );
  }
}
