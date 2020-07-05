import 'package:flutter/material.dart';
import 'package:fluttertodo/constants.dart';

class MainButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  MainButton({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textColor: Colors.white,
      color: kMainBlueColor,
      highlightColor: Color.fromRGBO(36, 187, 234, 0.2),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
