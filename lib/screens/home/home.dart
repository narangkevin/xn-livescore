import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:logger/logger.dart';
import 'package:xnlivescore/screens/authenticate/pushRegister.dart';
import 'package:xnlivescore/screens/authenticate/sign_in.dart';
import 'package:xnlivescore/screens/home/contactUs.dart';
import 'package:xnlivescore/screens/home/profile.dart';
import 'package:xnlivescore/screens/wrapper.dart';
import 'package:xnlivescore/services/auth.dart';
import 'package:xnlivescore/services/firebase_config.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:xnlivescore/screens/upcomingMatches.dart';
import 'package:xnlivescore/screens/standings.dart';
import 'package:xnlivescore/screens/topScorers.dart';

//Acquire token from https://www.football-data.org and insert it here
final String token = '';
var logger = Logger();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

Widget builder(BuildContext context) {
  return FutureBuilder(
    future: Config().setupRemoteConfig(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return snapshot.hasData || snapshot.hasError
          ? listLeagues(context)
          : Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
    },
  );
}

Widget listLeagues(BuildContext context) {
  final AuthService _auth = AuthService();
  int _selectedIndex = 0;

  void _onItemTapped(int index) async {
    _selectedIndex = index;
    if (_selectedIndex == 0) {
    } else if (_selectedIndex == 1) {
    } else if (_selectedIndex == 2) {}
  }

  _launchURL() async {
    const url = '';
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

  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.purple[900],
      title: Text('Home'),
      actions: <Widget>[
        FlatButton.icon(
          icon: Icon(
            Icons.live_tv,
            color: Colors.purple[100],
          ),
          label: Text(
            'Live TV',
            style: TextStyle(
              color: Colors.purple[100],
            ),
          ),
          onPressed: () {
            _launchURL();
          },
        ),
      ],
    ),
    drawer: Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'XN88 LiveScores',
              style: TextStyle(
                color: Colors.purple[100],
                fontFamily: 'Montserrat',
                fontSize: 40,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.purple[900],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new Home()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: Text('Contact'),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new ContactUs()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text('Account'),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new Profile()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async {
              // Update the state of the app.
              Navigator.pop(context);
              await _auth.signOut();
              await _auth.lineSignOut();
              Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new PushRegister()));
              print('Signed out');
            },
          ),
        ],
      ),
    ),
    body: Container(
      color: Colors.purple[900],
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                itemListView(
                    'assets/images/ic_premier_league.jpg',
                    context,
                    MainScreen(
                        'Premier League', 'PL', Color.fromRGBO(63, 16, 82, 1))),
                itemListView('assets/images/ic_laliga.jpg', context,
                    MainScreen('La Liga', 'PD', Color.fromRGBO(0, 52, 114, 1))),
                itemListView(
                    'assets/images/ic_serie_a.jpg',
                    context,
                    MainScreen(
                        'Serie A', 'SA', Color.fromRGBO(29, 150, 71, 1))),
                itemListView(
                    'assets/images/ic_bund.jpg',
                    context,
                    MainScreen(
                        'Bundesliga', 'BL1', Color.fromRGBO(177, 40, 41, 1))),
                itemListView(
                    'assets/images/ic_ligue1.jpg',
                    context,
                    MainScreen(
                        'Ligue 1', 'FL1', Color.fromRGBO(227, 76, 38, 1))),
              ],
            ),
          ),
//            bannerAd()
        ],
      ),
    ),
  );
}

//Widget bannerAd() {
//
//  _launchURL() async {
//    const url = '';
//    if (await canLaunch(url)) {
//      await launch(url,
//        // forceWebView: true,
//        // headers: <String, String>{'my_header_key': 'my_header_value'},
//      );
//    } else {
//      throw 'Could not launch $url';
//    }
//  }
//
//  return FutureBuilder(
//    future: isAppVisible(),
//    builder: (BuildContext context, AsyncSnapshot snapshot) {
//      return snapshot.hasData && snapshot.data == 1
//          ? Expanded(
//              flex: 1,
//              child: Container(
//                  color: Colors.purple[900],
//                  padding: EdgeInsets.all(2),
//                child: InkWell(
//                  onTap: () {
//                    _launchURL();
//                  },
//                  child: Image(
//                    image: AssetImage('assets/images/banner.JPG'),
//                  ),
//                ),
//              ),
//            )
//          : Container();
//    },
//  );
//}

Widget itemListView(
    String imgPath, BuildContext context, StatefulWidget newScreen) {
  return InkWell(
    highlightColor: Colors.purple[900],
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => newScreen));
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

class MainScreen extends StatefulWidget {
  String leagueName;
  String leagueCode;
  Color leagueColor;

  MainScreen(this.leagueName, this.leagueCode, this.leagueColor);

  createState() => MainScreenState(leagueName, leagueCode, leagueColor);
}

class MainScreenState extends State<MainScreen> {
  String leagueName;
  String leagueCode;
  Color leagueColor;

  MainScreenState(this.leagueName, this.leagueCode, this.leagueColor);

  Widget screenContent = Container();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            title: Text(leagueName),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Matches',
                ),
                Tab(
                  text: 'Standings',
                ),
                Tab(
                  text: 'Top Scorers',
                )
              ],
            ),
            backgroundColor: leagueColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            )),
        body: TabBarView(
          children: <Widget>[
            upcomingMatches(leagueCode, leagueColor),
            leagueStanding(leagueCode, leagueName, leagueColor),
            topScorers(leagueCode, leagueColor)
          ],
        ),
      ),
    );
  }

  void displayStandings() {
    setState(() {
      screenContent = leagueStanding('PL', leagueName, leagueColor);
    });
  }

  void displayMatches() {
    setState(() {
      screenContent = upcomingMatches(leagueCode, leagueColor);
    });
  }
}
