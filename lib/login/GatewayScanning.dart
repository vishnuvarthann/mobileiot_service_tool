import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wifi/wifi.dart';

class GatewayScanning extends StatefulWidget {
  @override
  _GatewayScanningState createState() => new _GatewayScanningState();
}

class _GatewayScanningState extends State<GatewayScanning> {
  String _wifiName = 'Connected  wifi ssid.';
  int level = 0;
  String _ip = 'Connected to Ip.';
  List ssidList = [];
  String ssid = '', password = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avilable Gateway'),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: ssidList.length,
          itemBuilder: (BuildContext context, int index) {
            if (ssidList.length!=0){
               for(int i=0;i<ssidList.length;i++){
                   if (ssidList[i].ssid.contains("IQAN -") == true){
                     print(ssidList[i].ssid.toString());
                   }
               }
            }
            // return itemSSID(index);
            return GestureDetector(
              onTap: () => _selectedItem(ssidList[index].ssid, context),
              child: Card(
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: new ListTile(
                      trailing: Icon(Icons.navigate_next,
                          color: Colors.black, size: 30.0),
                      title: new Text(ssidList[index].ssid,
                          style: TextStyle(
                              color: Colors.black87,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget itemSSID(index) {
    if (index == 0) {
      return Column(
        children: [
          Row(
            children: <Widget>[Text("Connected Gateway")],
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                child: Text('ssid'),
                onPressed: _getWifiName,
              ),
              Offstage(
                offstage: level == 0,
                child: Icon(Icons.wifi),
              ),
              Text(_wifiName),
            ],
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                child: Text('ip'),
                onPressed: _getIP,
              ),
              Text(_ip),
            ],
          ),
          Row(children: <Widget>[
            Center(
              child: Text(
                "Avilable Gateway device",
                textAlign: TextAlign.center,
              ),
            )
          ]),
         
        ],
      );
    } else {
      return Column(children: <Widget>[
        ListTile(
          leading: Icon(Icons.wifi),
          title: Text(
            ssidList[index - 1].ssid,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
            ),
          ),
          dense: true,
        ),
        Divider(),
      ]);
    }
  }

  void loadData() {
    Wifi.list('').then((list) {
      setState(() {
        ssidList = list;
      });
    });
  }
  // void loadData() async {
  //   Wifi.list('').then((list) {
  //       print(list.length);
  //       for(int i=0;i<list.length;i++){
  //               if (list[i].ssid.contains("IQAN -") == true){
  //                print(list[i].ssid.toString());
  //                setState(() {
  //                ssidList = list;
  //     });
  //       }

  //     }

  //   });
  // }

  Future<Null> _getWifiName() async {
    int l = await Wifi.level;
    String wifiName = await Wifi.ssid;
    setState(() {
      level = l;
      _wifiName = wifiName;
    });
  }

  Future<Null> _getIP() async {
    String ip = await Wifi.ip;
    setState(() {
      _ip = ip;
    });
  }

  Future<Null> connection(String ssid, String password) async {
    Wifi.connection(ssid, password).then((v) {
      print(v);
    });
  }

  _selectedItem(String string, BuildContext context) {
    Alert(
        context: context,
        title: string,
        content: Column(
          children: <Widget>[
          ],
        ),
        buttons: [
          DialogButton(
          
            onPressed: () async {
              connection(string,"IQAN_Connect");
              Navigator.pushNamed(context, '/sshServer',arguments :'shellscript');
            }, child: Text(
              "Connect",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
           
      ),
          
        ]).show();
  }
}
