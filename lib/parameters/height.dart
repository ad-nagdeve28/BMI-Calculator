// import 'dart:core';
// import 'package:flutter/material.dart';

// class HeightPara {
//   int i;
//   String parameter;
//   HeightPara(this.i, this.parameter);

//   static List<HeightPara> getParameters() {
//     return <HeightPara>[
//       HeightPara(1, "cm"),
//       HeightPara(2, "m"),
//       HeightPara(3, "ft"),
//     ];
//   }
// }

// class DropDown extends StatefulWidget {
//   DropDown() : super();
//   @override
//   DropDownState createState() => DropDownState();
// }

// class DropDownState extends State<DropDown> {
//   List<HeightPara> _height = HeightPara.getParameters();
//   late List<DropdownMenuItem<HeightPara>> _dropdownMenuItems;
//   late HeightPara _selectedHeight;

//   @override
//   void initState() {
//     _dropdownMenuItems = buildDropdownMenuItems(_height);
//     _selectedHeight = _dropdownMenuItems[0].value!;
//     super.initState();
//   }

//   List<DropdownMenuItem<HeightPara>> buildDropdownMenuItems(List heights) {
//     List<DropdownMenuItem<HeightPara>> items = <DropdownMenuItem<HeightPara>>[];
//     for (HeightPara ht in heights) {
//       items.add(DropdownMenuItem(value: ht, child: Text(ht.parameter)));
//     }
//     return items;
//   }

//   onChangeDropdownItem(HeightPara selectedHeight) {
//     setState(() {
//       _selectedHeight = selectedHeight;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             const Text("Height :"),
//             const SizedBox(
//               height: 20.0,
//             ),
//             DropdownButton(
//                 value: _selectedHeight,
//                 items: _dropdownMenuItems,
//                 onChanged: onChangeDropdownItem(_selectedHeight))
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  DropDown() : super();

  final String title = "DropDown Demo";

  @override
  DropDownState createState() => DropDownState();
}

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'Apple'),
      Company(2, 'Google'),
      Company(3, 'Samsung'),
      Company(4, 'Sony'),
      Company(5, 'LG'),
    ];
  }
}

class DropDownState extends State<DropDown> {
  //
  List<Company> _companies = Company.getCompanies();
  late List<DropdownMenuItem<Company>> _dropdownMenuItems;
  late Company _selectedCompany;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value!;
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = <DropdownMenuItem<Company>>[];
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("DropDown Button Example"),
        ),
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Select a company"),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButton(
                  value: _selectedCompany,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem(_selectedCompany),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Selected: ${_selectedCompany.name}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
