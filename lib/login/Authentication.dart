import 'package:flutter/material.dart';
import 'package:mobileiot_service_tool/Network/Loader.dart';
import 'package:mobileiot_service_tool/login/NavigationDrawer.dart';


import 'Login.dart';

class Authentication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _checkForAuthentication(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == true) {
                  return NavigationDrawer();
                } else {
                  return Login();
                }
              } else {
                  return Loader(
                    bckColor: Colors.red,
                  );
                }
            }));
  }

  Future<bool> _checkForAuthentication() async {
    return true;
  }
}
