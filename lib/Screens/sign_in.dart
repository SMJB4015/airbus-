import 'dart:convert';

import 'package:airbus_app/Screens/HomeCustomer.dart';
import 'package:airbus_app/Screens/HomeEntreprise.dart';
import 'package:airbus_app/Screens/signUp.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:airbus_app/blocs/auth/auth_events.dart';
import 'package:airbus_app/blocs/auth/auth_bloc.dart';
import 'package:airbus_app/blocs/auth/auth_states.dart';
import 'package:airbus_app/constantes.dart';
//import 'package:wiine/screens/signUp.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';
import '../repo/auth_repo.dart';

class SignIn extends StatefulWidget{
  @override
  State<SignIn> createState() => _SignIn();
  
  
}

class _SignIn extends State<SignIn>{
  late AuthBloc Authb;
  final _formKey = GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.all(12),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );
  @override
  void initState() {
    Authb=BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final logo = SizedBox(height:100,width:100,child: IconButton(onPressed: (){}, icon: Image.asset('images/plane.png')));
    final msg=BlocBuilder<AuthBloc,AuthStates>(builder: (context,state){
      if(state is LoginErrorState){
        return Text(state.message);
      }else if (state is LoginLoadingState){
        return Center(child: CircularProgressIndicator(backgroundColor: Colors.black,),);
      }else{
        return Container();
      }
    });
    final username = TextFormField(controller: email,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(prefixIcon: Icon(Icons.email),

          filled: true,
          hintStyle: TextStyle(color: Colors.black45),
          hintText:'Email',
          focusColor: Colors.white,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),

      validator: (value) {
        if (EmailValidator.validate(value!)) {
          return null ;
        }else{
          return('Please enter a valid email');

        }
      },
    );
    final pass = TextFormField(controller: password,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(prefixIcon: Icon(Icons.lock),
          filled: true,
          hintStyle: TextStyle(color: Colors.black45),
          hintText:'Mot de Passe',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10, 20, 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          fillColor: Colors.transparent),
          validator: (value) {
        if (value!.isEmpty) {
          return "Mot de passe ne peut pas etre vide";
        } else if (value.length < 8) {
          return "Longeur de Mot de passe < 8";
        }
        return null;
      },
    );
    return Scaffold(
      body:BlocBuilder<AuthBloc,AuthStates>(builder: (context,state){
        if(state is EntreInState){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  HomeEntreprise()),
          );
        }else if(state is CustmInState){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  HomeCustomer()),
          );
        }
          return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,end: Alignment.bottomLeft,colors:[Colors.white,Colors.white]
              )
          ),
          child: Stack(
              children: [
                Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: ClipPath(
                    clipper: WaveClipperOne(reverse: true),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(color: Color(0xFF14438F) ),
                      child: Padding(padding: const EdgeInsets.all(40),child: Text('AIRBUS',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: ClipPath(
                    clipper: WaveClipperOne(reverse: true),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(color: Color(0xFF14438F).withOpacity(0.5) ),
                    ),
                  ),
                ),
                Positioned(
                    child: Container(
                      child: Center(
                        child: Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(left: 24.0,right: 24.0),
                            children: <Widget>[
                              Center(child: Padding(padding: EdgeInsets.symmetric(vertical: 16.0),child: Text("Let's Go", style: TextStyle(color: Color(0xFF14438F),fontWeight: FontWeight.bold,fontSize:50)),)),
                              SizedBox(height: 20.0,),
                              logo,
                              SizedBox(height: 20.0,),
                              msg,
                              SizedBox(height: 20.0,),
                              username,
                              SizedBox(height: 20.0,),
                              pass,
                              SizedBox(height: 20.0,),
                              Padding(padding: EdgeInsets.symmetric(vertical: 16.0),
                                  child: ElevatedButton(
                                      style: raisedButtonStyle,
                                      onPressed: ()async{
                                        if(_formKey.currentState!.validate()){
                                          Authb.add(LoginButtonPressed(email: email.text,password: password.text));


                                       }

                                      }, child: Text('Log In',style: TextStyle(color: Colors.black),)
                                  )),Row(
                                mainAxisAlignment: MainAxisAlignment.center
                                ,children: [Text("Vous n'avez pas de compte ?"),Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute<Register>(builder: (_)=>
                                            MultiBlocProvider(providers: [BlocProvider(create: (context) => AuthBloc(LoginInitState(),AuthRepo()))],
                                                child:Register())));
                                      },
                                      child: Text("Register", textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)))
                              )],)
                              ,
                            ],
                          ),
                        ),
                      ),
                    )
                )]
          ),
        );
      })
    );
  }

}
