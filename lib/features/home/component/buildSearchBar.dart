import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Buildsearchbar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Container(
       height: 45,
       padding: EdgeInsets.symmetric(horizontal: 16),
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(25.0),
       ),
       child: Row(
         children: [
           Icon(Icons.search, color: Colors.blueGrey,),
           SizedBox(width: 10,),
           Expanded(
             child: TextField(
               decoration: InputDecoration(
                 border: InputBorder.none,
                 hintText: "Search Medicine & Healthcare products",
                 hintStyle: TextStyle(color: Colors.grey),
               ),
             ),
           )
         ],
       ),
     );
  }

}