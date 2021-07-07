import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebasestore/screens/home_screen.dart';
import 'package:flutterfirebasestore/services/authentication_service.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: ElevatedButton(
          child: Text("Google Login"),
          onPressed: () async {
            bool value =
                await AuthenticationService().signInWithGoogle(context);

            if (value) {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => HomeScreen()),
              );
            }
          },
        ),
      ),
    ));
  }
}
