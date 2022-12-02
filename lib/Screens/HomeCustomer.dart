import 'package:airbus_app/Composants/News_List.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter/cupertino.dart';

import '../blocs/news/news_bloc.dart';
import '../blocs/news/news_states.dart';

class HomeCustomer extends StatefulWidget{
  @override
  State<HomeCustomer> createState() => HomeP() ;

}

class HomeP extends State<HomeCustomer>{
  @override
  final List<String> listC = <String>['AirFrance', 'Tunisair','Novelair','Qatar Airways','Fly Eimrates'];
  String dropdownValueC = "AirFrance";
  final List<String> listCode = <String>['AFR1016', 'AFR1018','TNR702','FRC458','QTRA586'];
  String dropdownValueCode = "AFR1016";
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Color(0xFF14438F),
    minimumSize: Size(20, 80),
    padding: EdgeInsets.all(5),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );
  Widget build(BuildContext context) {
    final dropAIR=DropdownButton<String>(
      value: dropdownValueC,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black45),
      underline: Container(
        height: 2,
        color: Colors.black45,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValueC = value!;
        });
      },
      items: listC.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
    final dropFly=DropdownButton<String>(
      value: dropdownValueCode,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black45),
      underline: Container(
        height: 2,
        color: Colors.black45,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValueCode = value!;
        });
      },
      items: listCode.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
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
                BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
              ]
              ,
              backgroundColor: Color(0xFF14438F),fixedColor: Colors.teal,selectedFontSize: 15,unselectedFontSize: 10,unselectedItemColor: Colors.white
          ),
        ),
      ),
          body:ListView(children: [
            Padding(padding:  EdgeInsets.only(top:50.0),
              child: Container(
                  alignment: Alignment.center,
                  child: new Text("AirBus's Partners",style: TextStyle(fontSize: 50,color: Color(0xFF14438F)),)),),
            Positioned(
                child: Container(
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(left: 24.0,right: 24.0),
                        children: <Widget>[
                          dropAIR,
                          SizedBox(height: 20.0,),
                          dropFly,
                          SizedBox(height: 20.0,),
                          Padding(padding: EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButton(style: raisedButtonStyle,
                                  onPressed: (){
                                  //  if(formKey.currentState!.validate()){
                                   //   Authb.add(RegisterButtonPressed(email: email.text,password: password.text,infos_liv: infos_liv.text,nom: nom.text));
                                  //  }
                                  }, child: Text('Generate',style: TextStyle(color: Colors.white),)
                              )),

                        ],
                      ),
                    )
                )
            )
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