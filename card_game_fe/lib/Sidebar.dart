import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget{
  const Sidebar({super.key}); 
  
  @override
  Widget build(BuildContext context) {
    return Container( 
      width: 250,
      height: double.infinity,
      color: Colors.orange[300],
      child: Column(
        children: <Widget>[ 
          SizedBox(height: 20 ),
          ListTile( 
            leading: Icon(Icons.Home, color: Colors.amber[50],),
          )

          
        ],
      ))
  }
}


