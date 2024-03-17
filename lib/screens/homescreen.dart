import 'package:bmi/widgets/circularprogressindicator.dart';
import 'package:bmi/widgets/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";

  double i = 0;

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    final darkModeProvider = Provider.of<ThemeManager>(context);
    return Scaffold(
      backgroundColor: darkModeProvider.darkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        elevation: 0.0,
        title: const Text(
          "Body Mass",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Container(
        height: Height,
        width: Width,
        child: Column(
          children: [
            Container(
              height: Height / 2,
              color: Colors.lightGreen,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.white,

                    color:
                        darkModeProvider.darkMode ? Colors.black : Colors.white,
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: Width / 2.5,
                        padding: const EdgeInsets.only(
                            top: 50.0, bottom: 20.0, left: 20.0),
                        margin: EdgeInsets.only(
                          bottom: Height * 0.125,
                        ),
                        decoration: const BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30))),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Height :\n \t\t\t\t\t\t5.7 Ft",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(height: 8.0),
                            Text("Weight :\n \t\t\t\t\t\t68 Kg",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(height: 8.0),
                            Text("Age :\n \t\t\t\t\t\t25 Yr",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600))
                          ],
                        )),
                  ),
                  Expanded(
                    child: Container(
                        width: Width,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: darkModeProvider.darkMode
                                ? Colors.black
                                : Colors.white,
                            borderRadius: const BorderRadius.only(
                                // topLeft: Radius.circular(Width * 0.5)
                                topLeft: Radius.circular(60))),
                        child: Lottie.asset('assets/homepage/boy.json')),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CircularProgressIndicatorBar(6.0)
          ],
        ),
      ),
    );
  }
}



// ignore: must_be_immutable
