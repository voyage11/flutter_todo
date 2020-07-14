import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fluttertodo/constants.dart';
import 'package:fluttertodo/components/main_button.dart';
import 'package:fluttertodo/mixins/app_message.dart';
import 'package:fluttertodo/screens/todo_screen.dart';
import 'package:fluttertodo/services/auth.dart';
import 'package:fluttertodo/services/cache.dart';

class LoginScreen extends StatefulWidget with AppMessage {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _passwordNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    print('LoginScreen dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: kMainBlueColor,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              autocorrect: false,
              enableSuggestions: false,
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(_passwordNode);
              },
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              obscureText: true,
              textInputAction: TextInputAction.done,
              focusNode: _passwordNode,
              controller: _passwordController,
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              onSubmitted: (_) {
                login();
              },
            ),
            SizedBox(
              height: 80,
            ),
            MainButton(
              title: 'Login',
              type: ButtonType.login,
              onPressed: () {
                login();
              },
            )
          ],
        ),
      ),
    );
  }

  void login() {
    print('login Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
//    Provider.of<UserData>(context, listen: false)
//        .currentUser
//        .setEmailUid('email', 'uid');

    if (_emailController.text == '') {
      AppMessage.show(
          context: context,
          title: 'Error',
          description: 'Please enter an email.',
          type: MessageType.error);
    } else if (_passwordController.text == '') {
      AppMessage.show(
          context: context,
          title: 'Error',
          description: 'Please enter a password.',
          type: MessageType.error);
    } else {
      Auth()
          .login(
        _emailController.text,
        _passwordController.text,
      )
          .then((FirebaseUser user) {
        print('FirebaseUser: ${user.uid} email: ${user.email}');
        Cache().setCache(CacheType.uid, user.uid);
        Cache().setCache(CacheType.email, user.email);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => TodoScreen()),
          (route) => false,
        );
      }).catchError((e) => AppMessage.show(
              context: context,
              title: 'Error',
              description: e.toString(),
              type: MessageType.error));
    }
  }
}
