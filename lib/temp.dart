// import 'package:flutter/material.dart';
// import 'sign_up.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       routes: <String, WidgetBuilder>{
//         '/signup': (BuildContext context) => new SignupPage()
//       },
//       home: new MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         resizeToAvoidBottomPadding: false,
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               child: Stack(
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
//                     child: Text('Hello',
//                         style: TextStyle(
//                             fontSize: 80.0, fontWeight: FontWeight.bold)),
//                   ),
//                   Container(
//                     padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
//                     child: Text('There',
//                         style: TextStyle(
//                             fontSize: 80.0, fontWeight: FontWeight.bold)),
//                   ),
//                   Container(
//                     padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
//                     child: Text('.',
//                         style: TextStyle(
//                             fontSize: 80.0,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.purple[900])),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//                 padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
//                 child: Column(
//                   children: <Widget>[
//                     TextField(
//                       decoration: InputDecoration(
//                           labelText: 'EMAIL',
//                           labelStyle: TextStyle(
//                               fontFamily: 'Montserrat',
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey),
//                           focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.purple[900]))),
//                     ),
//                     SizedBox(height: 20.0),
//                     TextField(
//                       decoration: InputDecoration(
//                           labelText: 'PASSWORD',
//                           labelStyle: TextStyle(
//                               fontFamily: 'Montserrat',
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey),
//                           focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.purple[900]))),
//                       obscureText: true,
//                     ),
//                     SizedBox(height: 5.0),
//                     Container(
//                       alignment: Alignment(1.0, 0.0),
//                       padding: EdgeInsets.only(top: 15.0, left: 20.0),
//                       child: InkWell(
//                         child: Text(
//                           'Forgot Password',
//                           style: TextStyle(
//                               color: Colors.purple[900],
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Montserrat',
//                               decoration: TextDecoration.underline),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 40.0),
//                     InkWell(
//                       onTap: (){
//                         print('Login button tapped');
//                         // login code goes here
//                       },
//                       child: Container(
//                         height: 40.0,
//                         child: Material(
//                           borderRadius: BorderRadius.circular(20.0),
//                           shadowColor: Colors.purpleAccent[700],
//                           color: Colors.purple[900],
//                           elevation: 7.0,
//                           child: GestureDetector(
//                             onTap: () {
//                               print('Login text pressed');
//                               // Same code as login code
//                             },
//                             child: Center(
//                               child: Text(
//                                 'LOGIN',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontFamily: 'Montserrat'),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20.0),
//                     InkWell(
//                       onTap: () {
//                         print('LINE button tapped');
//                         //... LINE Login Code goes here
//                       },
//                       child: Container(
//                         height: 40.0,
//                         color: Colors.transparent,
//                         child: Container(
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: Colors.green,
//                                   style: BorderStyle.solid,
//                                   width: 1.0),
//                               color: Colors.transparent,
//                               borderRadius: BorderRadius.circular(20.0)),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
// //                            Center(
// //                              child:
// //                              ImageIcon(AssetImage('assets/line.png')),
// //                            ),
//                               SizedBox(width: 10.0),
//                               Center(
//                                 child: Text('LINE Login',
//                                     style: TextStyle(
//                                         color: Colors.green,
//                                         fontWeight: FontWeight.bold,
//                                         fontFamily: 'Montserrat')),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 )),
//             SizedBox(height: 15.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   'New to XNLiveScore ?',
//                   style: TextStyle(fontFamily: 'Montserrat'),
//                 ),
//                 SizedBox(width: 5.0),
//                 InkWell(
//                   onTap: () {
//                     Navigator.of(context).pushNamed('/signup');
//                   },
//                   child: Text(
//                     'Register',
//                     style: TextStyle(
//                         color: Colors.purple[900],
//                         fontFamily: 'Montserrat',
//                         fontWeight: FontWeight.bold,
//                         decoration: TextDecoration.underline),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ));
//   }
// }