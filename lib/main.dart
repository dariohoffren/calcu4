import 'package:flutter/material.dart';
import 'screens/calc.dart';
import 'screens/converter.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: "Calculator"),
                Tab(text: "KM2Mile"),
                Tab(text: "Logi"),
              ],
            ),
            title: const Text('Calcs & Stuff'),
          ),
          body: TabBarView(
            children: [
              Calc(),
              Converter(),
              const Text('Arvutus logi siia'),
            ],
          ),
        ),
      ),
    );
  }
}
