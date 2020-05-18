import 'package:firebase_auth/firebase_auth.dart';
import 'package:xnlivescore/models/user.dart';
import 'package:xnlivescore/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create User Object from Firebase User
  User _userFromFirebaseUser(FirebaseUser user){
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
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }

  // Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      // Create new document for User with uid
      //await DatabaseService(uid: user.uid).updateUserData(user.email, 'name');
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }

  // Login with Google

  // Login with Facebook

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}