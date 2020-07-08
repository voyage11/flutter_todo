import 'package:flutter/material.dart';
import 'package:fluttertodo/constants.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: kMainBlueColor,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
      ),
    );
  }
}
