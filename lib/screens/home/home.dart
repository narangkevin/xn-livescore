import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
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
        body: WebView(
          initialUrl: Uri.dataFromString(
              '<html><body><iframe class="liveScore-iframe" ng-src="https://freelive.7m.com.cn/live.aspx?mark=en&amp;TimeZone=%2B0800&amp;wordAd=&amp;wadurl=http://&amp;width=700&amp;cpageBgColor=FFFFFF&amp;tableFontSize=11&amp;cborderColor=DDDDDD&amp;ctdColor1=FFFFFF&amp;ctdColor2=E0E9F6&amp;clinkColor=0044DD&amp;cdateFontColor=333333&amp;cdateBgColor=FFFFFF&amp;scoreFontSize=12&amp;cteamFontColor=000000&amp;cgoalFontColor=FF0000&amp;cgoalBgColor=FFFFE1&amp;cremarkFontColor=0000FF&amp;cremarkBgColor=F7F8F3&amp;Skins=10&amp;teamWeight=400&amp;scoreWeight=700&amp;goalWeight=400&amp;fontWeight=700&amp;DSTbox=" src="https://freelive.7m.com.cn/live.aspx?mark=en&amp;TimeZone=%2B0800&amp;wordAd=&amp;wadurl=http://&amp;width=700&amp;cpageBgColor=FFFFFF&amp;tableFontSize=11&amp;cborderColor=DDDDDD&amp;ctdColor1=FFFFFF&amp;ctdColor2=E0E9F6&amp;clinkColor=0044DD&amp;cdateFontColor=333333&amp;cdateBgColor=FFFFFF&amp;scoreFontSize=12&amp;cteamFontColor=000000&amp;cgoalFontColor=FF0000&amp;cgoalBgColor=FFFFE1&amp;cremarkFontColor=0000FF&amp;cremarkBgColor=F7F8F3&amp;Skins=10&amp;teamWeight=400&amp;scoreWeight=700&amp;goalWeight=400&amp;fontWeight=700&amp;DSTbox=" width="100%" height="100%" frameborder="0" ></iframe></body></html>',
              mimeType: 'text/html').toString(),
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
