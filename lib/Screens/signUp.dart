
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import'package:email_validator/email_validator.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:airbus_app/blocs/auth/auth_bloc.dart';
import 'package:airbus_app/blocs/auth/auth_events.dart';
import 'package:airbus_app/blocs/auth/auth_states.dart';


class Register extends StatefulWidget{
  @override
  _UserRegister createState() => _UserRegister() ;
}

class _UserRegister extends State<Register>{
  final formKey = GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController passwordCo=TextEditingController();
  TextEditingController nom=TextEditingController();
  TextEditingController infos_liv=TextEditingController();
  TextEditingController tele = TextEditingController();
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.all(12),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );
  late AuthBloc Authb ;
  final List<String> list = <String>['Entreprise', 'Customer'];
  String dropdownValue = "Entreprise";
  void initState(){
    Authb=BlocProvider.of<AuthBloc>(context);
    super.initState() ;
  }
  @override
  void dispose() {
    Authb.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    final logo = SizedBox(height:200,width:100,child: IconButton(onPressed: (){}, icon: Text("Register",style:TextStyle(fontSize: 50,color: Color(0xFF14438F)))));

    final dropB=DropdownButton<String>(
      value: dropdownValue,
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
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

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
          fillColor: Colors.transparent),
      validator: (value) {
        if (EmailValidator.validate(value!)) {
          return null ;
        }else{
          return('Please enter a valid email');

        }
      },
    );
    final name = TextFormField(controller: nom,
      autofocus: false,
      decoration: InputDecoration(prefixIcon: Icon(Icons.person),
          filled: true,
          hintStyle: TextStyle(color: Colors.black45),
          hintText:'Nom',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10, 20, 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          fillColor: Colors.transparent),
      validator: (value) {
        if (value!.isEmpty) {
          return "Nom ne peut pas etre vide";
        } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
          return "Svp entre un nom vailde";
        }else if (value.length < 4) {
          return "Longeur de nom  minimuim 4";
        }
        return null;
      },
    );

    final pass = TextFormField(controller: password,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(prefixIcon: Icon(Icons.lock),
          filled: true,
          hintStyle: TextStyle(color: Colors.black45),
          hintText:'Mot de passe',
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
    final pass2 = TextFormField(controller: passwordCo,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(prefixIcon: Icon(Icons.lock),
          filled: true,
          hintStyle: TextStyle(color: Colors.black45),
          hintText:'Confirmation Mot de Passe',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10, 20, 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          fillColor: Colors.transparent),
      validator: (value) {
        if (value!=password.text) {
          return('Svp entre Votre Mot de passe ici pour le confirmer');
        }else if (value!.isEmpty) {
          return "Confirmation de mot de passe ne peut pas etre vide";
        }
        return null;
      },
    );


    return Scaffold(
      body:BlocBuilder<AuthBloc,AuthStates>(builder: (context,state){
        if(state is UserRegisterSuccessState ){
          Authb.add(StartAEvent());
          Navigator.pop(context);
          return Container();
        }else {
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
                        child: Padding(padding: const EdgeInsets.all(40),child: Text('AIRBUS',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,) )),
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
                            key: formKey,
                            autovalidateMode: AutovalidateMode.always,
                            child: ListView(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(left: 24.0,right: 24.0),
                              children: <Widget>[
                                logo,
                                //SizedBox(height: 20.0,),
                                msg,
                                SizedBox(height: 20.0,),
                                username,
                                SizedBox(height: 20.0,),
                                dropB,
                                SizedBox(height: 20.0,),
                                name,
                                SizedBox(height: 20.0,),
                                pass,
                                SizedBox(height: 20.0,),
                                pass2,
                                SizedBox(height: 20.0,),
                                Padding(padding: EdgeInsets.symmetric(vertical: 16.0),
                                    child: ElevatedButton(style: raisedButtonStyle,
                                        onPressed: (){
                                          if(formKey.currentState!.validate()){
                                            bool x=false ;
                                            if(dropdownValue=="Entreprise"){
                                              x=true ;
                                            }
                                            Authb.add(RegisterButtonPressed(email: email.text,password: password.text,nom: nom.text,role:x));
                                          }
                                        }, child: Text('Register',style: TextStyle(color: Colors.black),)
                                    )),

                              ],
                            ),
                          ),
                        )
                      )
                  )]
            ),
          );
        }
      }
      ),
    );
  }

}

