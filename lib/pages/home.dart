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
      humidity = worker.humidity ?? " No Found " ;

    });
  }

  // Call getData and update state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

            )
          ],
        ),
      ),
    );
  }

  /// hit api
}
