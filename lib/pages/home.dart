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
  String icon = "";

  TextEditingController searchcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  ///
  // void fetchWeather() async {
  //   Worker worker = Worker(location: "kannauj");
  //
  //   /// get data function
  //   await worker.getData();
  //   setState(() {
  //     temp = worker.temp ?? " No Found";
  //     humidity = worker.humidity ?? " No Found ";
  //     airSpeed = worker.airSpeed ?? "No Found ";
  //     icon = worker.icon ?? "No Found ";
  //     description = worker.description ?? " No Found ";
  //
  //   });
  // }

  void fetchWeather([String city = "searchcontroller"]) async {
    Worker worker = Worker(location: city);   // 👈 use the city
    await worker.getData();

    setState(() {
      temp = worker.temp ?? "No Found";
      humidity = worker.humidity ?? "No Found";
      airSpeed = worker.airSpeed ?? "No Found";
      icon = worker.icon ?? "No Found";
      description = worker.description ?? "No Found";
    });
  }


  // Call getData and update state

  @override
  Widget build(BuildContext context) {
    var City_Name = ["delhi", "mumbai", "kanpur", "agra", "lucknow", "london"];
    final _random = new Random();
    var city = City_Name[_random.nextInt(City_Name.length)];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.blue[100],
          )),
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          padding: EdgeInsets.only(
            left: 15,
            right: 10,
          ),
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
                  color: Colors.white,
                  border: Border.all(),
                ),
                child: TextField(
                  controller: searchcontroller,
                  decoration: InputDecoration(
                    prefixIcon: GestureDetector(
                      onTap: () {
                        String city = searchcontroller.text.trim();
                        if (city.isNotEmpty) {
                          fetchWeather(city); // 👈 fetch new weather
                        }
                      },
                      child: Icon(Icons.search),
                    ),

                    hintText: "Search $city",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14)),
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: [
                           Image.network("https://openweathermap.org/img/wn/${icon}@2x.png"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(" $description"),
                              Text(" in kannauj"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                /// ----------------------temperature box-----------------------//
                children: [
                  Expanded(
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14)),
                      padding: EdgeInsets.all(30),
                      margin: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.thermostat_outlined,color: Colors.blueAccent[200],
                            size: 40,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${temp}'C",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  /// ----------------------wind box-------------------------
                  Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14)),
                      padding: EdgeInsets.all(30),
                      margin: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.air_sharp,color: Colors.blueAccent[200]),
                          Text(
                            "${airSpeed}",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text("Km/hr")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14)),
                      padding: EdgeInsets.all(30),
                      margin: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.water_drop_outlined,color: Colors.blueAccent[200],),
                          Text(
                            "${humidity}",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text("percent")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Made by VSC",
                style: TextStyle(color: Colors.black12, fontSize: 30),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// hit api
}
