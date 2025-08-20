import 'dart:convert';
import 'package:http/http.dart';

class Worker {
  /// --- Variables --- ///
  String? location;

  String? temp;
  String? humidity;
  String? airSpeed;
  String? description;
  String? main;
  String? icon;

  Worker({this.location});

  /// --- Method to fetch data --- ///
  Future<void> getData() async {
   try{
     final response = await get(Uri.parse(
       "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=831e623477f9e091b518cd949a356556",
     ));
     if (response.statusCode == 200) {
       final Map<String, dynamic> data = jsonDecode(response.body);
       final mainData = data["main"];
       final windData = data["wind"];
       final weatherDetails = data["weather"][0];

       // Convert temperature from Kelvin to Celsius
       double getTemp = (mainData["temp"] - 273.15).toDouble();
       double getHumidity = mainData["humidity"].toDouble();
       double getAirSpeed = windData["speed"].toDouble();
       String getMainDes = weatherDetails["main"];
       String getDesc = weatherDetails["description"];
       String getIcon = weatherDetails["icon"];


       // Assign formatted values
       temp = getTemp.toStringAsFixed(1);
       humidity = getHumidity.toStringAsFixed(0);
       airSpeed = getAirSpeed.toStringAsFixed(1);
       description = getDesc;
       main = getMainDes;
       icon = getIcon;
     } else {
       print("Failed to load weather data: ${response.statusCode}");
     }
   }catch(e){
         temp = 'Data is not founded';
         humidity = 'Data is not founded';
         airSpeed = 'Data is not founded';
         description = 'Data is not founded';
         main = 'Data is not founded';
         icon = '10d';
   }

  }
}
