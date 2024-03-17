import 'package:bmi/screens/homescreen.dart';
import 'package:bmi/screens/inputscreen.dart';
import 'package:bmi/screens/splashscreen.dart';
import 'package:bmi/test.dart';
import 'package:bmi/widgets/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeManager(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class BMICalculat extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculat> {
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  double _bmiResult = 0.0;
  String _selectedUnit = 'Metric';
  final List<String> _units = ['Metric', 'Imperial'];

  @override
  void initState() {
    super.initState();
    _heightController = TextEditingController();
    _weightController = TextEditingController();
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _calculateBMI() {
    double height = double.parse(_heightController.text);
    double weight = double.parse(_weightController.text);

    if (_selectedUnit == 'Imperial') {
      // Convert height from inches to meters and weight from pounds to kilograms
      height = height * 2.54; // inches to centimeters
      weight = weight * 0.453592; // pounds to kilograms
    }

    double heightInMeters = height / 100; // Convert height from cm to meters
    double bmi = weight / (heightInMeters * heightInMeters);

    setState(() {
      _bmiResult = bmi;
    });
  }

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<ThemeManager>(context);
    print("Hello world: ${darkModeProvider.darkMode}");
    return Scaffold(
      backgroundColor:
          darkModeProvider.darkMode ? const Color(0xFF282828) : Colors.white,
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: _selectedUnit,
              onChanged: (newValue) {
                setState(() {
                  _selectedUnit = newValue!;
                });
              },
              items: _units.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              dropdownColor: Colors.lightGreen,
              padding: const EdgeInsets.all(8.0),
            ),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText:
                    'Height (${_selectedUnit == 'Metric' ? 'cm' : 'in'})',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText:
                    'Weight (${_selectedUnit == 'Metric' ? 'kg' : 'lb'})',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20.0),
            Text(
              'BMI: ${_bmiResult.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20.0),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter your username',
                      hintText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Define the action when the button is pressed
                  },
                ),
              ],
            ),
            Switch(
                value: darkModeProvider.darkMode,
                onChanged: (value) {
                  darkModeProvider.saveDarkModePreference(value);
                })
          ],
        ),
      ),
    );
  }
}
