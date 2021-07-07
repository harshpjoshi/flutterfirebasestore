import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebasestore/services/authentication_service.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("FlutterFire"),
        leading: Icon(
          Icons.arrow_back_ios_rounded,
          size: 14,
        ),
        backgroundColor: CupertinoColors.systemGrey5,
        trailing: GestureDetector(onTap: () {
          AuthenticationService().logout(context);
        }, child: Text("Logout")),
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}
