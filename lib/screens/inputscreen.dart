import 'package:bmi/screens/homescreen.dart';
import 'package:bmi/widgets/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputScreen extends StatefulWidget {
  @override
  InputScreenState createState() => InputScreenState();
}

class InputScreenState extends State<InputScreen> {
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
      height = height * 2.54; // inches to centimeters
      weight = weight * 0.453592; // pounds to kilograms
    }

    double heightInMeters = height / 100; // Convert height from cm to meters
    double bmi = weight / (heightInMeters * heightInMeters);

    setState(() {
      _bmiResult = bmi;
      print("BMI Calculation : ${_bmiResult}");
    });
  }

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<ThemeManager>(context);
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,

      // darkModeProvider.darkMode ? const Color(0xFF282828) : Colors.white,
      body: Padding(
        padding: EdgeInsets.all(Width * 0.15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide:
                        const BorderSide(color: Colors.lightGreen, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide:
                        const BorderSide(color: Colors.lightGreen, width: 1)),
                labelText:
                    'Height (${_selectedUnit == 'Metric' ? 'cm' : 'in'})',
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide:
                        const BorderSide(color: Colors.lightGreen, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide:
                        const BorderSide(color: Colors.lightGreen, width: 1)),
                labelText:
                    'Weight (${_selectedUnit == 'Metric' ? 'kg' : 'lb'})',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: Width * 0.4),
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(16.0),
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
                iconEnabledColor: Colors.deepPurple,
                focusColor: Colors.deepOrange,
                padding: const EdgeInsets.all(8.0),
              ),
            ),
            const SizedBox(height: 20.0),
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

//   @override
//   Widget build(BuildContext context) {
//     final darkModeProvider = Provider.of<ThemeManager>(context);
//     return Scaffold(
//       backgroundColor:
//           darkModeProvider.darkMode ? Color(0xFF181818) : Colors.white,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: Height * 0.06,
//             width: Width,
//             margin: EdgeInsets.symmetric(horizontal: Width * .05),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(Width * .08),
//                 border: Border.all(color: Colors.greenAccent, width: 1)),
//           ),
//           TextField(
//             controller: _heightController,
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(
//               labelText: 'Height (${_selectedUnit == 'Metric' ? 'cm' : 'in'})',
//             ),
//           ),
//           const SizedBox(height: 20),
//           Switch(
//               value: darkModeProvider.darkMode,
//               onChanged: (value) {
//                 darkModeProvider.saveDarkModePreference(value);
//               }),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => HomeScreen()));
//               },
//               child: Text("Next.!"))
//         ],
//       ),
//     );
//   }
}
