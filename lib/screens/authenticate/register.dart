import 'package:flutter/material.dart';
import 'package:xnlivescore/screens/authenticate/pushRegister.dart';
import 'package:xnlivescore/screens/authenticate/sign_in.dart';
import 'package:xnlivescore/screens/wrapper.dart';
import 'package:xnlivescore/services/auth.dart';
import 'package:xnlivescore/shared/loading.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String error = '';

  // text field State
  String email = "";
  String password = "";
  String name = "";
  String phone = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.deepPurple[50],
            resizeToAvoidBottomPadding: false,
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                      child: Text(
                        '',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[900]),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'EMAIL / อีเมลล์',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              // hintText: 'EMAIL',
                              // hintStyle: ,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.purple[900]))),
                          validator: (val) => !val.contains('@') |
                                  !val.contains('.com') |
                                  val.isEmpty
                              ? 'Enter a valid email / ใส่อีเมลที่ถูกต้อง'
                              : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'PASSWORD / รหัสผ่าน',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.purple[900]))),
                          obscureText: true,
                          validator: (val) => val.length < 6
                              ? 'Enter at least 6 characters / กรอกรหัสผ่านที่ประกอบด้วยอักขระอย่างน้อย 6 ตัว'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'NICK NAME / ชื่อเล่น',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.purple[900]))),
                          validator: (val) => val.length < 1
                              ? 'Enter a nick name / กรอกชื่อเล่น'
                              : null,
                          onChanged: (val) {
                            setState(() => name = val);
                          },
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'PHONE NUMBER / เบอร์โทรศัพท์มือถือ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.purple[900]))),
                          validator: (val) => val.length < 10
                              ? 'Enter a phone number / กรอกเบอร์โทรศัพท์มือถือ'
                              : null,
                          onChanged: (val) {
                            setState(() => phone = val);
                          },
                        ),
                        SizedBox(height: 50.0),
                        InkWell(
                          onTap: () async {
                            print('SignUp button pressed');
                            // SignUp Code goes here
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password, name, phone);
                              if (result == null) {
                                setState(() {
                                  error = 'Please supply a valid email';
                                  loading = false;
                                });
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
                                  print('SignUp text pressed');
                                  // same code as sign_up
                                  if (_formKey.currentState.validate()) {
                                    setState(() => loading = true);
                                    dynamic result = await _auth
                                        .registerWithEmailAndPassword(
                                            email, password, name, phone);
                                    if (result == null) {
                                      setState(() {
                                        error = 'Please supply a valid email';
                                        loading = false;
                                      });
                                    }
                                    Navigator.pushReplacement(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                new Wrapper()));
                                  } else {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text("Invalid Credentials"),
                                    ));
                                    print('invalid credentials');
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    'SIGNUP',
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
//                        Container(
//                          height: 40.0,
//                          color: Colors.transparent,
//                          child: Container(
//                            decoration: BoxDecoration(
//                                border: Border.all(
//                                    color: Colors.black,
//                                    style: BorderStyle.solid,
//                                    width: 1.0),
//                                color: Colors.transparent,
//                                borderRadius: BorderRadius.circular(20.0)),
//                            child: InkWell(
//                              onTap: () {
//                                // Navigator.of(context).pop();
//                                Navigator.pushReplacement(
//                                    context,
//                                    new MaterialPageRoute(
//                                        builder: (BuildContext context) =>
//                                            new PushRegister()));
//                              },
//                              child: Center(
//                                child: Text('Go Back',
//                                    style: TextStyle(
//                                        fontWeight: FontWeight.bold,
//                                        fontFamily: 'Montserrat')),
//                              ),
//                            ),
//                          ),
//                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Already Have An Account?',
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
                                            new SignIn()));
                              },
                              child: Text(
                                'Login / เข้าสู่ระบบ',
                                style: TextStyle(
                                    color: Colors.purple[900],
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.purple[900],
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.purpleAccent[700]
                                          .withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.arrow_back),
                                  tooltip: 'Go Back',
                                  color: Colors.white,
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
                  )),
              // SizedBox(height: 15.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Text(
              //       'New to Spotify?',
              //       style: TextStyle(
              //         fontFamily: 'Montserrat',
              //       ),
              //     ),
              //     SizedBox(width: 5.0),
              //     InkWell(
              //       child: Text('Register',
              //           style: TextStyle(
              //               color: Colors.purple[900],
              //               fontFamily: 'Montserrat',
              //               fontWeight: FontWeight.bold,
              //               decoration: TextDecoration.underline)),
              //     )
              //   ],
              // )
            ]));
  }
}
