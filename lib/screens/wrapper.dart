import 'package:flutter/material.dart';
import 'package:xnlivescore/models/user.dart';
import 'package:xnlivescore/screens/authenticate/authenticate.dart';
import 'package:xnlivescore/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    print(user);
    
    // Return Home() or  Authenticate()
    if (user == null){
      return Authenticate();
    }
    else {
      return Home();
    }
  }
}
