import 'package:flutter/material.dart';
import 'package:xnlivescore/models/user.dart';
import 'package:xnlivescore/screens/wrapper.dart';
import 'package:xnlivescore/services/auth.dart';
import 'package:provider/provider.dart';
 import 'package:flutter_line_sdk/flutter_line_sdk.dart';


 void main() {
    WidgetsFlutterBinding.ensureInitialized();
    LineSDK.instance.setup("${1654115088}").then((_) {
      print("LineSDK Prepared");
    });
   runApp(MyApp());
 }

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}