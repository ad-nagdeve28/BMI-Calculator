import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            '5:41 AM',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.battery_charging_full,
                color: Colors.black,
              ),
              onPressed: () {}, // Handle battery icon press
            ),
            IconButton(
              icon: Icon(
                Icons.signal_cellular_alt_outlined,
                color: Colors.black,
              ),
              onPressed: () {}, // Handle signal icon press
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0.0, // Remove app bar shadow
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'A31',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0), // Add spacing
              Text(
                'Ideal for the health conscious\nKeep your body at a glance.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  // textBaseline: TextAlign.center,
                ),
              ),
              SizedBox(height: 40.0), // Add spacing
              ElevatedButton(
                onPressed: () {}, // Handle button press
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
