import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobileiot_service_tool/Utility/AppButton.dart';
import 'package:mobileiot_service_tool/Utility/MyConstants.dart';


class LandingFragment extends StatefulWidget {
  LandingFragment({Key key}) : super(key: key);
  @override
  _LandingFragmentState createState() => _LandingFragmentState();
}

class _LandingFragmentState extends State<LandingFragment> {
  var connectivityResult;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: new SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                  
                    children: <Widget>[
                      SizedBox(height: 30,),
                      Text(
                        MIOT.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                       SizedBox(height: 30,),
                      Container(
                        color: Colors.blue,
                        child: Image.asset('assets/images/iot.jpg'),
                      ),
                       SizedBox(height: 30,),
                      AppButton(
                          id: "login",
                          width: size.width * 0.7,
                          height: size.height * 0.07,
                          onPressed: (route, count, id) =>
                              this._clicked(route, context, id),
                          route: '/Wifiscan',
                          title: MIOT.login),
                     
                      AppButton(
                        id: 'help',
                        width: size.width * 0.7,
                        height: size.height * 0.07,
                        onPressed: (route, count, id) =>
                            this._clicked(route, context, id),
                        route: '/wificonnect',
                        title: MIOT.help,
                      ),
                      SizedBox(height: 30,),
                      Container(
                         alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                        child: Text(
                          MIOT.appVersion,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily:'Schyler',
                            decorationStyle: TextDecorationStyle.wavy,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                ),
              ),
            ));
  }

  _clicked(route, context, id) async {
    _serviceCall(id);
    Navigator.pushNamed(context, route, arguments: id);
  }

  _serviceCall(id) {}

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
  }
}
