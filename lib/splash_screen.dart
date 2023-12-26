import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/constant_values.dart';
import 'package:untitled/login_screen.dart';
import 'package:untitled/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var object=Constants();

  @override
  void initState() {

    super.initState();

    navigat();

    }

  navigat()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? isLogin = preferences.getBool("isLogin");

    if(isLogin==true){
      Timer(const Duration(seconds: 2),(){
        Navigator.pushReplacement((context),
            MaterialPageRoute(builder: (context)=>const MyHomePage()) );
      });
    }else{
      Timer(const Duration(seconds: 2),(){
        Navigator.pushReplacement((context),
            MaterialPageRoute(builder: (context)=>const LoginScreen()) );
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Column( crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          Icon(Icons.facebook_outlined,
          size: 80,
          color: object.iconcolor,
          ),
          const Expanded(child: SizedBox()),
          const Text('from',
          style: TextStyle(
            fontSize: 18,
            color:Color.fromRGBO(0,0,250,0.9),
          ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/thetalogo.jpeg',
              height:40,
              width: 50,
              ),
               const Text('Meta',style: TextStyle(
                fontSize: 24,
                color:Color.fromRGBO(0,0,250,0.9),
              ),),
            ],
          ),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }
}
