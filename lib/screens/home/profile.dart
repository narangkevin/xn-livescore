import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:xnlivescore/models/user.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text('Profile'),
        actions: <Widget>[

        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/appfinal.png'),
              ),
              Text(
                'Kevin',
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.purple[900],
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
              Text(
                'XNLiveScore Member',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.purple[100],
                    fontFamily: 'Montserrat',
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.purple[900],
                    ),
                    title: Text(
                      '+66949090301',
                      style: TextStyle(
                        color: Colors.purple.shade900,
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.mail,
                      color: Colors.purple[900],
                    ),
                    title: Text(
                      'narangkevin@gmail.com',
                      style: TextStyle(
                        color: Colors.purple.shade900,
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
        ),
      ),
    );
  }
}
