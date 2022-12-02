import 'package:airbus_app/Composants/News_List.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter/cupertino.dart';

import '../blocs/news/news_bloc.dart';
import '../blocs/news/news_states.dart';

class HomeEntreprise extends StatefulWidget{
  @override
  State<HomeEntreprise> createState() => HomeP() ;

}

class HomeP extends State<HomeEntreprise>{
  @override
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.green[300],
    minimumSize: Size(20, 80),
    padding: EdgeInsets.all(5),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(bottomNavigationBar: Container(decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 3, blurRadius: 10),
        ],
      ),
        child: ClipRRect( borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.storefront),label: 'Store'),
                BottomNavigationBarItem(icon: Icon(Icons.airplanemode_on),label: 'My Planes'),
                BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
              ]
              ,
              backgroundColor: Color(0xFF14438F),fixedColor: Colors.teal,selectedFontSize: 15,unselectedFontSize: 10,unselectedItemColor: Colors.white
          ),
        ),
      ),
          body:ListView(children: [
            Carousel,
            Padding(padding:  EdgeInsets.only(top:50.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text('News',style: TextStyle(fontSize: 50,color: Color(0xFF14438F)),)),),
           // ListNews

          ],)
          ),
    ) ;
  }
  Widget Carousel =CarouselSlider(
    items:[Image.asset('images/slide1.png'),Image.asset('images/slide2.png'),Image.asset('images/slide3.jpg')],
    options: CarouselOptions(
      autoPlay: true,
      enlargeCenterPage: true,
      initialPage: 0,
      viewportFraction: 1,

    ),

  );
  Widget ListNews = BlocBuilder<NewsBloc,NewsStates>(
      builder: (context,state){
        if(state is InitialState){
          return CircularProgressIndicator(backgroundColor: Colors.blue,);
        }else if (state is SuccessNews){
          return Row(

              children:<Widget>[Expanded(child: SizedBox
                (height: 200,child:
              GridView.builder(itemCount: state.news!.length,scrollDirection: Axis.horizontal ,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),itemBuilder: (context,index){

                return NewsView(newss: state.news![index] )
                ;}
              )
              )
              )
              ]

          );


        }else{return Container();}

      }
  );

}