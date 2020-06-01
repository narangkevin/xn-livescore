import 'package:flutter/material.dart';
import 'package:xnlivescore/screens/authenticate/register.dart';
import 'package:xnlivescore/screens/authenticate/sign_in.dart';

class PushRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.purple[900],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(1),
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/headbanner.jpg')
                      ],
                    ),
                  ),
                  SizedBox(height: 1.0),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                new Register()));
                      },
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Image.asset('assets/images/ic_premier_league.jpg'),
                          ),
                          Expanded(
                            flex: 2,
                            child: Image.asset('assets/images/ic_laliga.jpg'),
                          ),
                        ],
                      ),
                    ),
                  ),
              Container(
                padding: EdgeInsets.all(1),
                color: Colors.purple[900],
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                            new Register()));
                  },
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Image.asset('assets/images/commentary.jpg'),
                      ),
                      SizedBox(width: 1.0),
                      Expanded(
                        flex: 3,
                        child: Image.asset('assets/images/liveScore.jpg'),
                      ),
                      SizedBox(width: 1.0),
                      Expanded(
                        flex: 3,
                        child: Image.asset('assets/images/streaming.jpg'),
                      ),
                    ],
                  ),
                ),
              ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.amber[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.amber[600],
                    height: 15,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                    new Register()));
                          },
                          child: Text(
                            'Signup',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                                color: Colors.amber[600],
                            ),
                          ),
                        ),
                        SizedBox(width: 150.0),
//                          Icon(
//                            Icons.arrow_forward,
//                            color: Colors.purple[100],
//                          ),
                        InkWell(
                          onTap: (){
                            Navigator.pushReplacement(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                    new SignIn()));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.amber[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
