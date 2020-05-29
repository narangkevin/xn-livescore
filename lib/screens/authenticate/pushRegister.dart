import 'package:flutter/material.dart';
import 'package:xnlivescore/screens/authenticate/register.dart';

class PushRegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup1': (BuildContext context) => new Register()
      },
      home: new PushRegister(),
    );
  }
}

class PushRegister extends StatefulWidget {
  @override
  _PushRegisterState createState() => _PushRegisterState();
}

class _PushRegisterState extends State<PushRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        elevation: 0,
//        title: Text(
//            'Select a League',
//          style: TextStyle(
//            color: Colors.purple[900],
//          ),
//        ),
//      ),
      body: Container(
        color: Colors.purple[900],
        child: Column(
          children: <Widget>[
//            Row(
//              children: <Widget>[
//                Expanded(
//                  flex: 4,
//                  child: ListView(
//                    shrinkWrap: true,
//                    children: <Widget>[
//                      itemListView('assets/images/ic_premier_league.png', context),
//                      itemListView('assets/images/ic_premier_league.png', context),
//                    ],
//                  ),
//                ),
//              ],
//            ),
            Expanded(
              flex: 4,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  itemListView('assets/images/ic_premier_league.png', context),
                  itemListView('assets/images/ic_premier_league.png', context),
                  itemListView('assets/images/ic_premier_league.png', context),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            Center(
                              child: Container(
                                child: Text(
                                  'PICK A LEAGUE',
                                  style: TextStyle(
                                      fontSize: 50.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      color: Colors.amber[700]),
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
//            bannerAd()
          ],
        ),
      ),
    );
  }

  Widget itemListView(String imgPath, BuildContext context) {
    return InkWell(
      highlightColor: Colors.purple[900],
      onTap: () {
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => new Register()));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
        child: Card(
          elevation: 20,
          color: Colors.white,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Image.asset(imgPath),
                ),
              ],
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}
