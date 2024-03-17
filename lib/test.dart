import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  TestState createState() => TestState();
}

class TestState extends State<Test> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF282828),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // height: Height * 0.07,
            width: Width,
            margin: EdgeInsets.symmetric(horizontal: Width * 0.1),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TabBar(
                      controller: tabController,
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.lightGreen,
                      indicatorColor: Colors.yellowAccent,
                      indicatorWeight: 2,
                      indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          border:
                              Border.all(color: Colors.lightGreen, width: 1)),
                      tabs: [
                        Tab(
                          text: "Male",
                          icon: Icon(Icons.male_rounded),
                        ),
                        Tab(
                          child: Container(
                            width: Width * 1.5,
                            height: Height,
                            color: Colors.orange,
                            child: Row(
                              children: [
                                Text("Female"),
                                Icon(Icons.female_rounded)
                              ],
                            ),
                          ),
                        )
                      ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GenderTabBar extends StatelessWidget {
  final Function(bool) onSelect; // Callback function to handle selection

  const GenderTabBar({Key? key, required this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
          icon: Icon(Icons.man),
          text: "Male",
        ),
        Tab(
          icon: Icon(Icons.woman),
          text: "Female",
        ),
      ],
      onTap: (index) => onSelect(index == 0), // Call callback with selection
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isSelectedMale = true; // Initially selected gender (optional)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gender Selection'),
      ),
      body: Center(
        child: GenderTabBar(
          onSelect: (isSelectedMale) {
            setState(() {
              _isSelectedMale = isSelectedMale;
            });
            // Handle selection logic here (optional)
          },
        ),
      ),
    );
  }
}
