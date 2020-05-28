import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:xnlivescore/screens/home/home.dart';
import 'package:xnlivescore/services/auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text('Account'),
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
//              Text(
//                'Kevin',
//                style: TextStyle(
//                    fontSize: 40.0,
//                    color: Colors.purple[900],
//                    fontWeight: FontWeight.bold,
//                    fontFamily: 'Montserrat'),
//              ),
              SizedBox(height: 20.0),
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
                  color: Colors.purple.shade100,
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
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                child: InkWell(
                  onTap: () async {
                    print('LINE button tapped');
                    //... LINE Login Code goes here
                    try {
                      dynamic result = await LineSDK.instance.login(
                          scopes: ["profile", "openid", "email"]);
                      print(result.toString());
                      if (result.toString() != null) {
                        setState(() {
                          loading = true;
                          Navigator.pushReplacement(
                              context,
                              new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  new Home()));
                        });
                        print('Line login successful');
                      } else {
                        setState(() {
                          loading = false;
                          print(
                              'Line login terminated due to some error');
                        });
                      }
                    } on PlatformException catch (e) {
                      print(e.message);
                    }
                    dynamic res = await _auth.lineLogin();
                    print ('res: '+ res);
//                              dynamic result = await _auth.lineLogin();
//                              print ("result: " + result);
//                              if (!result.isEmpty()) {
//                                setState(() {
//                                  loading = true;
//                                  Navigator.pushReplacement(context, new MaterialPageRoute(builder: (BuildContext context) => new Home()));
//                                });
//                                print('Line login successful');
//                              } else {
//                                setState(() {
//                                  loading = false;
//                                  print('Line login terminated due to some error');
//                                });
//                              }
                  },
                  child: Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.green,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
//                            Center(
//                              child:
//                              ImageIcon(AssetImage('assets/line.png')),
//                            ),
                          SizedBox(width: 10.0),
                          Center(
                            child: Text('LINE Login',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat')),
                          ),
                        ],
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
