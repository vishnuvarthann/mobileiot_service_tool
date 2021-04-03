import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobileiot_service_tool/login/SshServer.dart';
import 'package:wifi/wifi.dart';

class Wifiscan extends StatefulWidget {
  @override
  _WifiscanState createState() => new _WifiscanState();
}

class _WifiscanState extends State<Wifiscan> {
 @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Wifi',
      theme: new ThemeData(
        primarySwatch: Colors.yellow
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        title: Text('MobileIOT'),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: ssidList.length + 1,
          itemBuilder: (BuildContext context, int index) {
            return itemSSID(index);
            
           
         
          },
        ),
      ),
    );
  }

  Widget itemSSID(index) {
    if (index == 0) {
      return Column(
        children: [
          Row(children:<Widget> [
            Text("Connected Gateway")
          ],),
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
          TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.wifi_lock),
              hintText: 'Your wifi ssid',
              labelText: 'ssid',
            ),
            keyboardType: TextInputType.text,
            onChanged: (value) {
              ssid = value;
            },
          ),
          TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.lock_outline),
              hintText: 'Your wifi password',
              labelText: 'password',
            ),
            keyboardType: TextInputType.text,
            onChanged: (value) {
              password = value;
            },
          ),
          RaisedButton(
            child: Text('connection'),
            onPressed: connection,
          ),
         ],
       );
    } else { 
      return Column(children: <Widget>[
        ListTile(
          leading:Icon(Icons.wifi),
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

  Future<Null> connection() async {
    Wifi.connection(ssid, password).then((v) {
 Navigator.push(
                context,
               MaterialPageRoute(builder: (context) => SshServer()),
              );

      print(v);
    });
  }
}

  
  

  
