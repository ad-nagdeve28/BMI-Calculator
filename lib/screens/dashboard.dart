import 'package:bmi/widgets/circularprogressindicator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DashBoard extends StatelessWidget {
  double bmi = 0.0;

  DashBoard(double i, {super.key}) {
    this.bmi = i;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  CircularProgressIndicatorBar(bmi),
                  Text("Progress!")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
