import 'package:flutter/material.dart';
import 'package:fluttertodo/constants.dart';
import 'package:fluttertodo/components/main_button.dart';
import 'package:fluttertodo/mixins/app_message.dart';
import 'package:fluttertodo/screens/welcome_screen.dart';
import 'package:fluttertodo/services/cache.dart';
import 'package:fluttertodo/services/auth.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with AppMessage {
  TextEditingController _uidController = TextEditingController(text: '');
  TextEditingController _emailController = TextEditingController(text: '');
  TextEditingController _displayNameController =
      TextEditingController(text: '');
  String _displayName = '';

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    var uid = await Cache().getCache(CacheType.uid);
    var email = await Cache().getCache(CacheType.email);
    _displayName = await Cache().getCache(CacheType.displayName);
    //print('future uid: $uid');
    setState(() {
      _uidController = TextEditingController(text: uid);
      _emailController = TextEditingController(text: email);
      _displayNameController = TextEditingController(text: _displayName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: kMainBlueColor,
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onPressed: () {
              print('first Name: $_displayName');
              Auth().saveFirstName(_displayName).then((user) {
                print('save user _displayName: ${user.displayName}');
                AppMessage.show(
                    context: context,
                    title: 'Success',
                    description: 'Name is saved successfully.',
                    type: MessageType.success);
                Navigator.pop(context);
              }).catchError((e) => AppMessage.show(
                  context: context,
                  title: 'Error',
                  description: e.toString(),
                  type: MessageType.error));
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'UID',
                  ),
                  textInputAction: TextInputAction.next,
                  controller: _uidController,
                  readOnly: true,
                  autofocus: false,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  readOnly: true,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'First Name',
                  ),
                  textInputAction: TextInputAction.done,
                  controller: _displayNameController,
                  onChanged: (displayName) {
                    setState(() {
                      _displayName = displayName;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                MainButton(
                  title: 'Logout',
                  type: ButtonType.complete,
                  onPressed: () {
                    Cache().setCache(CacheType.uid, '');
                    Cache().setCache(CacheType.email, '');
                    Cache().setCache(CacheType.displayName, '');
                    AppMessage.show(
                        context: context,
                        title: 'Success',
                        description: 'Logout successfully.',
                        type: MessageType.success);
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
                      (route) => false,
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
