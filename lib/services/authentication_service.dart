import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebasestore/main.dart';
import 'package:flutterfirebasestore/models/user.dart';
import 'package:flutterfirebasestore/services/user_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthenticationService {
  Future<bool> signInWithGoogle(BuildContext context) async {
    try {
      UserCredential userCredential;

      if (kIsWeb) {
        var googleProvider = GoogleAuthProvider();
        userCredential = await _auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final googleAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        userCredential = await _auth.signInWithCredential(googleAuthCredential);
      }

      final user = userCredential.user;

      await UserService().addUser(UserModel(
          email: user.email,
          name: user.displayName,
          profilePic: user.photoURL,
          uid: user.uid));

      ScaffoldMessenger.maybeOf(context).showSnackBar(SnackBar(
        content: Text('Sign In ${user.uid} with Google'),
      ));

      return true;
    } catch (e) {
      print(e);
      ScaffoldMessenger.maybeOf(context).showSnackBar(SnackBar(
        content: Text('Falied to signin'),
      ));
      return false;
    }
  }

  logout(BuildContext context) {
    FirebaseAuth.instance
        .signOut()
        .then(
            (value) => Navigator.of(context).popUntil((route) => route.isFirst))
        .onError((error, stackTrace) => logger.e(error));
  }
}
