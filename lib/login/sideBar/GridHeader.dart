import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class GridHeader extends StatefulWidget {
  @override
  _GridHeaderState createState() => _GridHeaderState();
}

class _GridHeaderState extends State<GridHeader> {

  List<String> listHeader = ['DebugLog',];
  List<String> listTitle = ['GetLogs','Uploadlogs','Cleanup Storage','Connect to Gateway'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MobileIOT-Service-Tool"),
      ),
      body: gridHeader(),
    );
  }


  Widget gridHeader(){
    return new ListView.builder(itemCount: listHeader.length,itemBuilder: (context, index) {
      return new StickyHeader(
        header: new Container(
          height: 28.0,
          color: Colors.white,
          padding: new EdgeInsets.symmetric(horizontal: 12.0),
          alignment: Alignment.center,
          child: new Text(listHeader[index],
            style: const TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
          ),
        ),
        content: Container(
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: listTitle.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1,),
            itemBuilder: (contxt, indx){
              return Card(
                margin: EdgeInsets.all(10.0),
                color: Colors.grey,
                child: Padding(
                 padding: const EdgeInsets.all(12),
                  child: Center(child: Text(listTitle[indx], style: TextStyle(fontSize: 16, color: Colors.black),)),
                ),
              );
            },
          ),
        ),
      );
    },
      shrinkWrap: true,
    );
  }
}