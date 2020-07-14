import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'todo_screen.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';

import 'package:fluttertodo/services/cache.dart';

class LoadingScreen extends StatelessWidget {
  static const String id = 'loading_screen';
  @override
  Widget build(BuildContext context) {
    getUID(context);
    return Scaffold(
        body: Center(
      child: Loading(
        indicator: BallSpinFadeLoaderIndicator(),
        size: 100.0,
        color: Colors.blueGrey,
      ),
    ));
  }

  void getUID(BuildContext context) async {
    String uid = await Cache().getCache(CacheType.uid);
    String email = await Cache().getCache(CacheType.email);

    print('welcome uid: $uid email: $email');
    if (uid == '') {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
        (route) => false,
      );
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => TodoScreen()),
        (route) => false,
      );
    }
  }
}
