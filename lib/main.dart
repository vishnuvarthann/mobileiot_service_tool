import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobileiot_service_tool/login/Authentication.dart';
import 'package:mobileiot_service_tool/login/Login.dart';
import 'package:mobileiot_service_tool/login/SignOut.dart';
import 'package:mobileiot_service_tool/login/Wifiscan.dart';
import 'package:mobileiot_service_tool/login/sideBar/GridHeader.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      //  initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      routes: {
         '/Authentication': (BuildContext context) => Authentication(),
         '/login': (BuildContext context) => Login(),
         '/signOut': (BuildContext context) => SignOut(),
        // '/loginotp': (BuildContext context) =>
        //     PinCodeVerificationScreen("8801376221100"),
        //  '/Aboutfragment':(context) =>Aboutfragment(),
         '/Wifiscan':(context)=> Wifiscan(),
         '/GridHeader':(context)=>GridHeader()
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
 

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<Timer> startTime() async {
    const Duration _duration = Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/Authentication');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Image.asset('assets/images/parker.jpg'),
      ),
    );
  }
}
