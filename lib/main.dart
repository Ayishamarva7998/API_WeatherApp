import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/location_provider.dart';
import 'package:flutter_application_1/controller/weatherprovider.dart';
import 'package:flutter_application_1/services/weather_service_p.dart';
import 'package:flutter_application_1/view/home_screen/home.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build (BuildContext context){
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => LocationProvider(),),
      ChangeNotifierProvider(create: (context) => WeatherProvider(),)
    ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
    home:   HomePage(),
      ),
    );
  }
}