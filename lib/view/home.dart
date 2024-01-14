import 'package:flutter/material.dart';

final textcontroller = TextEditingController();

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  opacity: .7,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/weather2.jpg'))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Search here...",
                      prefixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search))),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 160),
                  child: Text(
                    "30.34\u00b0c",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                const Text('Clouds'),
                const Text("location"),
                SizedBox(
                  height: 400,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(120),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                "assets/hot-PhotoRoom.png-PhotoRoom.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                "assets/cold-PhotoRoom.png-PhotoRoom.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                  "assets/sun-PhotoRoom.png-PhotoRoom.png"),
                            ),
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                  "assets/moon-PhotoRoom.png-PhotoRoom.png"),
                            ),
                          ],
                        )
                      ],
                    ),
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
