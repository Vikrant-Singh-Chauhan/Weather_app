import 'dart:math';

import 'package:flutter/material.dart';
import '../worker/worker.dart';

///import 'worker.dart'; // <-- Import your worker class file here

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String temp = "Loading...";
  String humidity = "";
  String airSpeed = "";
  String description = "";
  String main = "";

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  ///
  void fetchWeather() async {
    Worker worker = Worker(location: "jdydvhuj");

    /// get data function
    await worker.getData();
    setState(() {
      temp = worker.temp ?? " ";
      humidity = worker.humidity ?? " No Found ";
    });
  }

  // Call getData and update state

  @override
  Widget build(BuildContext context) {
    var City_Name = ["delhi","mumbai","kanpur","agra","lucknow","london"];
    final _random = new Random();
    var city = City_Name[_random.nextInt(City_Name.length)];
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          padding: EdgeInsets.only(left: 15,right: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(

                padding: EdgeInsets.all(4),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  color: Colors.white.withOpacity(0.5),
                    border: Border.all(),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: GestureDetector(
                      onTap: (){},
                        child: Icon(Icons.search)
                    ),
                    hintText: "Search $city",
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// hit api
}
