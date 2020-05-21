import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xnlivescore/screens/authenticate/sign_in.dart';
import 'package:xnlivescore/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.purple[900],
          title: Text('XNLiveScore'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              label: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                await _auth.signOut();
                await _auth.lineSignOut();
                Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new SignIn()));
                print('Signed out');
              },
            ),
          ],
        ),
        body: Container(
          child: Center(
            child: FlatButton(
              color: Colors.purple[900],
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              child: Text(
                'Launch LiveScores',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              // onPressed: _launchURL(),
              onPressed: () {
                _launchURL();
              },
            ),
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://www.xncasino.com/livescore';
    if (await canLaunch(url)) {
      await launch(
        url,
        // forceWebView: true,
        // headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
