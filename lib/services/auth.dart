import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:xnlivescore/models/user.dart';
import 'package:xnlivescore/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create User Object from Firebase User
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Auth Change User Stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // Sign in Anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // Register with email and password
  Future registerWithEmailAndPassword(
      String email, String password, String name, String phone) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      // Create new document for User with uid
      await DatabaseService(uid: user.uid)
          .updateUserData(user.email, name, phone);

      var _databaseRef = FirebaseDatabase().reference().child('users');
      _databaseRef.push().set({
        'email': user.email,
        'name': name,
        'phone': '(+66)' + phone,
      });
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // Login with Google

  // Login with Facebook

  // Login with LINE
  Future lineLogin() async {
    try {
      final res = await LineSDK.instance.getProfile();
      var _databaseRef =
          FirebaseDatabase().reference().child('lineusers').child(res.userId);
      _databaseRef.set({
        'name': res.displayName,
        'avatar': res.pictureUrl,
      });
      return res;
//       user id -> result.userId
//       user name -> result.displayName
//       user avatar -> result.pictureUrl
    } on PlatformException catch (e) {
      print(e.message);
      return null;
    }
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future lineSignOut() async {
    try {
      await LineSDK.instance.logout();
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
