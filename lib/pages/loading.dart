import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mausam_app/pages/home.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 4) , (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 150,),

            Lottie.asset("assets/lottie/weather_anim.json"),
            Text("loading...",style: TextStyle(color: Colors.black38,fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(21),
                  backgroundColor: Colors.orange.shade100,
                  color: Colors.orange,
                )),
            SizedBox(height: 200,),
            Text("Made by Vikrant")

          ],
        ),
      ),
    );
  }
}
