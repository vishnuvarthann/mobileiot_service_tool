import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color color;
  final double height;
  final double width;
  final String route;
  final String id;

  

  AppButton(
      {this.title = '',
       this.color = Colors.black,
      @required this.onPressed,
      this.id,
      this.route,    
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.yellow,
                  Colors.yellow,
                 Colors.yellow,
                ],
              
              ),
             
              ),
        height: height,
        width: width,
      
        margin: EdgeInsets.all(5),
        child: FlatButton(
          
         shape: RoundedRectangleBorder(
          

  borderRadius: BorderRadius.circular(0.0),
  side: BorderSide(color: Colors.yellow)
),
          child: Text(title, style: TextStyle(color: Colors.black, fontSize: 18.0, fontFamily:'Trajan Pro',),),
          onPressed: ()=> this.onPressed(route,context,id),
        ));
  }
}
