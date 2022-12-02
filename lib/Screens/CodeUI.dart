
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/code.dart';

class CodeView extends StatelessWidget{
      Code cde ;
     CodeView({required this.cde}) ;
  @override
  Widget build(BuildContext context) {
    if(this.cde.classif=="Gold"){
      return Container(height: 500,width:300,decoration:BoxDecoration(color:Colors.yellow),child: Column(children: [
        Stack(children:[
          Text(cde.codee,style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
          SizedBox(width:100,height:20),
          Text(cde.classif,style:TextStyle(color:Colors.redAccent,fontWeight:FontWeight.bold))

        ])],),);
    }else if (this.cde.classif=="Silver"){
      return Container(height: 500,width:300,decoration:BoxDecoration(color:Colors.grey),child: Column(children: [
        Stack(children:[
          Text(cde.codee,style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
          SizedBox(width:100,height:20),
          Text(cde.classif,style:TextStyle(color:Colors.greenAccent,fontWeight:FontWeight.bold))

        ])],),);
    }else{
      return Container(height: 500,width:300,decoration:BoxDecoration(color:Colors.brown),child: Column(children: [
        Stack(children:[
          Text(cde.codee,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
          SizedBox(width:100,height:20),
          Text(cde.classif,style:TextStyle(color:Colors.black26,fontWeight:FontWeight.bold))

        ])],),);
    }
  }

}