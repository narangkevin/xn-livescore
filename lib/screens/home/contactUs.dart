import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text('Contact'),
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
              'XNLiveScore',
              style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.purple[900],
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
            Text(
              'Contact Us',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.amber[600],
                  fontFamily: 'Montserrat',
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.amber.shade600,
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
                    '+66987654321',
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
                    'xnemail@gmail.com',
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
