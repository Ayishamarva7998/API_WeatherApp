import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/location_provider.dart';
import 'package:flutter_application_1/services/weather_service_p.dart';
import 'package:provider/provider.dart';

TextEditingController cityController = TextEditingController();

class HomePage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}
  
class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    super.initState();
    final locationProvider=Provider.of<LocationProvider>(context,listen: false);
    locationProvider.determinePosition().then((_){
      if(locationProvider.currentLocationname!=null){
        var city=locationProvider.currentLocationname!.locality;
        if(city!=null){
          Provider.of<WeatherServiceProvider>(context,listen: false).WeatherDataByCity(city);
        }
      }

    }

    );
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.all(15),
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: .7,
                fit: BoxFit.cover,
                image: AssetImage('assets/weather2.jpg'),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(2),
                          child: Icon(Icons.location_on, color: Colors.red),
                        ),
                        const SizedBox(width: 10),
                        Consumer<LocationProvider>(builder: (context, value, child) => 
                         Column(
                            children: [
                              Text(
                                value.currentLocationname?.locality ?? "unknown location",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Text(
                              //   "Good morning",
                              //   style: TextStyle(
                              //     fontSize: 20,
                              //     fontWeight: FontWeight.bold,
                              //     color: Color.fromARGB(255, 9, 53, 89),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Column(
                    //   children: [
                    //     const Text("Refresh"),
                    //     IconButton(
                    //       onPressed: () {},
                    //       icon: const Icon(
                    //         Icons.refresh,
                    //         color: Colors.blue,
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: cityController,
                        decoration: InputDecoration(
                          labelText: "Search City ...",
                          labelStyle: const TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 73, 72, 72),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                 Column(
                  children: [
                    Consumer<WeatherServiceProvider>(builder: (context, value, child) => 
                  Text(
                        "${value.weather?.temp??'N?A'}",
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w200,
                          color: Color.fromARGB(255, 30, 109, 33),
                        ),
                      ),
                    ),
                    Consumer<WeatherServiceProvider>(builder: (context, value, child) => 
                    const Text(
                        'clouds',
                        // "${value.weather?.}"
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                    Consumer<WeatherServiceProvider>(builder: (context, value, child) => 
                    Text(
                      
                        // ignore: unnecessary_string_interpolations
                        "${value.weather?.cityName??'N/A'}",
                          
                          style: const TextStyle( 
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 49, 68, 78),
                          ),
                        ),
                    ),
                    // Text(
                    //   "celcious",
                    //   style: TextStyle(
                    //     fontSize: 25,
                    //     color: Color.fromARGB(255, 49, 68, 78),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 100),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 330,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/hot-PhotoRoom.png-PhotoRoom.png",
                            width: 79,
                          ),
                        Column(
                            children: [
                              const Text(
                                "max temp",
                                style: TextStyle(color: Colors.white),
                              ),
                              Consumer<WeatherServiceProvider>(builder: (context, value, child) => 
                               Text(
                                  // "37.8",
                                  "${value.weather?.tempmin??"N/A"}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Image.asset(
                            "assets/cold-PhotoRoom.png-PhotoRoom.png",
                            width: 50,
                            // height: 60,
                          ),
                           Column(
                            children: [
                              const Text(
                                "max cold",
                                style: TextStyle(color: Colors.white),
                              ),
                              Consumer<WeatherServiceProvider>(builder: (context, value, child) => 
                               Text(
                                  // "37.8",
                                  "${value.weather?.tempmax??"N/A"}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 10,
                        thickness: 1.5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/sun-PhotoRoom.png-PhotoRoom.png",
                            width: 60,
                          ),
                       Column(
                            children: [
                              const Text(
                                "sun",
                                style: TextStyle(color: Colors.white),
                              ),
                              Consumer<WeatherServiceProvider>(builder: (context, value, child) => 
                             const Text(
                              "",
                              //  "${value.weather.}"
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Image.asset(
                            "assets/moon-PhotoRoom.png-PhotoRoom.png",
                            width: 70,
                            color: Colors.white,
                          ),
                          const Column(
                            children: [
                              Text(
                                "moon",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "37.8",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
