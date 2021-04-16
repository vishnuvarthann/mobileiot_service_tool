import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobileiot_service_tool/Utility/MyConstants.dart';
import 'package:mobileiot_service_tool/login/Aboutfragment.dart';
import 'package:mobileiot_service_tool/login/LandingFragment.dart';
import 'package:mobileiot_service_tool/login/sideBar/SidebarList.dart';

// ignore: must_be_immutable
class NavigationDrawer extends StatefulWidget {
  bool neeAppBar = true;
  final List<String> taptitles = [
    BOTTOMNAV.title,
    BOTTOMNAV.help,
    BOTTOMNAV.trackservic
  ];


  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  Widget container = LandingFragment();
  int _currentIndex = 0;
  String title = "";

  // var alertStyle = AlertStyle(
  //   animationType: AnimationType.fromTop,
  //   isCloseButton: true,
  //   isOverlayTapDismiss: false,
  //   descStyle: TextStyle(fontWeight: FontWeight.bold),
  //   animationDuration: Duration(milliseconds: 400),
  //   alertBorder: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(0.0),
  //     side: BorderSide(
  //       color: Colors.white70,
  //     ),
  //   ),
  //   titleStyle: TextStyle(
  //     color: Colors.yellowAccent,
  //   ),
  // );

  final List<Widget> _children = [
    LandingFragment(),
    Aboutfragment(),
  ];
  @override
  Widget build(BuildContext context) {
    final taptitle = widget.taptitles[_currentIndex];
    title = taptitle;
    return Scaffold(
      drawer: Drawer(
        child: SidebarList(
          pickedOption: _pickedOption,
        ),
      ),
      
      appBar: widget.neeAppBar ?AppBar(
        backgroundColor: Colors.white,
         iconTheme: const IconThemeData(color: Colors.yellow),
         title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  Image.asset(
                 'assets/images/icon.jpg',
                  fit: BoxFit.contain,
                  height: 32,
                  width: 32,
              ),
              Container(
                  padding: const EdgeInsets.all(2), child: Text('MIOTST'))
            ],
          ),
      ):null,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.yellow,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: _tabSelected,
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
             
            ),
            title: Text(
              BOTTOMNAV.trackservic,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.info,
            
            ),
            title: new Text(
              MIOT.info,
              style: new TextStyle(
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _tabSelected(tab) async {
    setState(() {
      _currentIndex = tab;
      title = widget.taptitles[tab];
      print(_currentIndex);
      if (_currentIndex == 0) {
         widget.neeAppBar= true ;
        // _customizedALERT();
      }else {
       widget.neeAppBar= false ;
      }
    });
  }

  Future <void>_pickedOption(menu) async {
    assert(menu != null);
    Navigator.pop(context);
    switch (menu) {
      case Menu.aboutus:
        Navigator.pushNamed(context, '/Wifiiot',
            arguments: {'type': Menu.aboutus});
        break;
      case Menu.loginotp:
        Navigator.pushNamed(context, '/GridHeader', arguments: {'type': Menu.loginotp});
        break;
    case Menu.loginotp:
        Navigator.pushNamed(context, '/faq', arguments: {'type': Menu.loginotp});
        break;
     
      case Menu.signOut:
        Navigator.pushNamed(context, '/DevicesListScreen',
            arguments: {'type': Menu.signOut});
        break;
    }
    print(menu);
  }

  // void _customizedALERT() {
  //   Alert(
  //     context: context,
  //     style: alertStyle,
  //     type: AlertType.none,
  //     title: Trackservice.trackservice,
  //     desc: Trackservice.trackhint,
  //     buttons: [
  //       DialogButton(
  //           child: Text(
  //             Trackservice.trackid,
  //             style: const TextStyle(color: Colors.white, fontSize: 16),
  //           ),
  //           onPressed: () {
  //             // Navigator.push(
  //             //   context,
  //             //  // MaterialPageRoute(builder: (context) => TrackServiceAlert()),
  //             // );
  //           }),
  //       DialogButton(
  //           child: Text(
  //             Trackservice.mobileNo,
  //             style: const TextStyle(color: Colors.white, fontSize: 16),
  //           ),
  //           onPressed: () {
  //             // Navigator.push(
  //             //   context,
  //             //  // MaterialPageRoute(builder: (context) => ServiceHistory()),
  //             // );
  //           }),
  //     ],
  //   ).show();
  // }
}
