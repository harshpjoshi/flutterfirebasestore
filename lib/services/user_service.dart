import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfirebasestore/models/user.dart';

import '../main.dart';

class UserService{

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(UserModel user) async{

    int length = await users.where("email",isEqualTo: user.email).snapshots().length;

    if(length == 0){

      return users
          .add(user.toJson()).then((value) => logger.i("User Added")).catchError((error) => logger.e("Failed to add user: $error"));

    }
  }

}