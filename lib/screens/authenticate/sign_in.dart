import 'package:flutter/material.dart';
import 'package:xnlivescore/screens/authenticate/pushRegister.dart';
import 'package:xnlivescore/screens/authenticate/register.dart';
import 'package:xnlivescore/screens/wrapper.dart';
import 'package:xnlivescore/services/auth.dart';
import 'package:xnlivescore/shared/loading.dart';

dynamic result;

class SignInApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup1': (BuildContext context) => new Register()
      },
      home: new SignIn(),
    );
  }
}

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => new _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String error = '';

  //text field State
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                        child: Text('Welcome',
                            style: TextStyle(
                                fontSize: 80.0, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                        child: Text('Back',
                            style: TextStyle(
                                fontSize: 80.0, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                        child: Text('',
                            style: TextStyle(
                                fontSize: 80.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple[900])),
                      )
                    ],
                  ),
                ),
                Container(
                    padding:
                        EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'EMAIL',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple[900]))),
                            validator: (val) => !val.contains('@') |
                                    !val.contains('.com') |
                                    val.isEmpty
                                ? 'Enter a valid email'
                                : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'PASSWORD',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple[900]))),
                            obscureText: true,
                            validator: (val) => val.length < 6
                                ? 'Enter a password with at least "6 (SIX)" characters.'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
//                          SizedBox(height: 5.0),
//                          Container(
//                            alignment: Alignment(1.0, 0.0),
//                            padding: EdgeInsets.only(top: 15.0, left: 20.0),
//                            child: InkWell(
//                              child: Text(
//                                'Forgot Password',
//                                style: TextStyle(
//                                    color: Colors.purple[900],
//                                    fontWeight: FontWeight.bold,
//                                    fontFamily: 'Montserrat',
//                                    decoration: TextDecoration.underline),
//                              ),
//                            ),
//                          ),
                          SizedBox(height: 40.0),
                          InkWell(
                            onTap: () async {
                              print('Login button tapped');
                              // login code goes here
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.signInWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error =
                                        'Could not Login with the credentials provided. Please provide valid credentials.';
                                    loading = false;
                                  });
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text("Invalid Credentials"),
                                  ));
                                }
                                Navigator.pushReplacement(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            new Wrapper()));
                              }
                            },
                            child: Container(
                              height: 40.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.purpleAccent[700],
                                color: Colors.purple[900],
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () async {
                                    print('Login text pressed');
                                    // Same code as login code
                                    if (_formKey.currentState.validate()) {
                                      setState(() => loading = true);
                                      dynamic result = await _auth
                                          .signInWithEmailAndPassword(
                                              email, password);
                                      if (result == null) {
                                        setState(() {
                                          error =
                                              'Could not Login with the credentials provided. Please provide valid credentials.';
                                          loading = false;
                                        });
                                        Scaffold.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("Invalid Credentials"),
                                        ));
                                      }
                                      Navigator.pushReplacement(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  new Wrapper()));
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
//                          Container(
//                            height: 40.0,
//                            color: Colors.transparent,
//                            child: Container(
//                              decoration: BoxDecoration(
//                                  border: Border.all(
//                                      color: Colors.black,
//                                      style: BorderStyle.solid,
//                                      width: 1.0),
//                                  color: Colors.transparent,
//                                  borderRadius: BorderRadius.circular(20.0)),
//                              child: InkWell(
//                                onTap: () {
//                                  // Navigator.of(context).pop();
//                                  Navigator.pushReplacement(
//                                      context,
//                                      new MaterialPageRoute(
//                                          builder: (BuildContext context) =>
//                                              new PushRegister()));
//                                },
//                                child: Center(
//                                  child: Text('Go Back',
//                                      style: TextStyle(
//                                          fontWeight: FontWeight.bold,
//                                          fontFamily: 'Montserrat')),
//                                ),
//                              ),
//                            ),
//                          ),
//                          InkWell(
//                            onTap: () async {
//                              print('LINE button tapped');
//                              //... LINE Login Code goes here
//                              try {
//                                dynamic result = await LineSDK.instance.login(
//                                    scopes: ["profile", "openid", "email"]);
//                                print(result.toString());
//                                if (result.toString() != null) {
//                                  setState(() {
//                                    loading = true;
//                                    Navigator.pushReplacement(
//                                        context,
//                                        new MaterialPageRoute(
//                                            builder: (BuildContext context) =>
//                                                new Home()));
//                                  });
//                                  print('Line login successful');
//                                } else {
//                                  setState(() {
//                                    loading = false;
//                                    print(
//                                        'Line login terminated due to some error');
//                                  });
//                                }
//                              } on PlatformException catch (e) {
//                                print(e.message);
//                              }
//                              dynamic res = await _auth.lineLogin();
//                              print ('res: '+ res);
////                              dynamic result = await _auth.lineLogin();
////                              print ("result: " + result);
////                              if (!result.isEmpty()) {
////                                setState(() {
////                                  loading = true;
////                                  Navigator.pushReplacement(context, new MaterialPageRoute(builder: (BuildContext context) => new Home()));
////                                });
////                                print('Line login successful');
////                              } else {
////                                setState(() {
////                                  loading = false;
////                                  print('Line login terminated due to some error');
////                                });
////                              }
//                            },
//                            child: Container(
//                              height: 40.0,
//                              color: Colors.transparent,
//                              child: Container(
//                                decoration: BoxDecoration(
//                                    border: Border.all(
//                                        color: Colors.green,
//                                        style: BorderStyle.solid,
//                                        width: 1.0),
//                                    color: Colors.transparent,
//                                    borderRadius: BorderRadius.circular(20.0)),
//                                child: Row(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
////                            Center(
////                              child:
////                              ImageIcon(AssetImage('assets/line.png')),
////                            ),
//                                    SizedBox(width: 10.0),
//                                    Center(
//                                      child: Text('LINE Login',
//                                          style: TextStyle(
//                                              color: Colors.green,
//                                              fontWeight: FontWeight.bold,
//                                              fontFamily: 'Montserrat')),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
                        ],
                      ),
                    )),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'New to XNLiveScore?',
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                    SizedBox(width: 5.0),
                    InkWell(
                      onTap: () {
                        // Navigator.of(context).pushNamed('/signup1');
                        Navigator.pushReplacement(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new Register()));
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.purple[900],
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          tooltip: 'Go Back',
                          color: Colors.purple[900],
                          hoverColor: Colors.purple[400],
                          iconSize: 40,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                    new PushRegister()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
