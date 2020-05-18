import 'package:flutter/material.dart';
import 'package:xnlivescore/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  // Redirects to Sign-In page
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}