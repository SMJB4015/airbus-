import 'dart:async';


import 'package:airbus_app/Screens/sign_in.dart';
import 'package:airbus_app/blocs/auth/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/auth_states.dart';
import '../repo/auth_repo.dart';
//import 'package:tads/screens/sign_in.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      Timer(Duration(seconds: 5), () =>
        Navigator.pushReplacement(context, MaterialPageRoute<SignIn>(builder: (_)=>MultiBlocProvider(
      providers: [
            BlocProvider(create: (context) => AuthBloc(LoginInitState(),AuthRepo()))
      ],child: SignIn(),
    )
    )
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(

          children: <Widget>[
            SizedBox(height: 100,
              child: Container(
                decoration: BoxDecoration(color: Color(0xFF14438F),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 250.0),child:Image.asset(
                        'images/Airbus.png',
                        height: 200,
                      ) ,
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        valueColor:AlwaysStoppedAnimation<Color>(Color(0xFF14438F)),backgroundColor: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),

                    ],
                  ),
                ),SizedBox(height: 100,
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xFF14438F),borderRadius: BorderRadius.only(topRight: Radius.circular(100))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
