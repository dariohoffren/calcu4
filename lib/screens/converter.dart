import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  String dropdownValue = 'Mile to km';
  double result = 0.0;
  double input = 0.0;
  _ConverterState(){


  }
  void convert() {
    setState(() {
      if (dropdownValue == 'Mile to km') {
        //  1 mile = 1.60934 km
        result = input * 1.60934;
      } else if (dropdownValue == 'Km to mile') {
        result = input * 0.621371;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) {
                    dropdownValue = newValue;
                  }
                });
              },
              items: <String>['Mile to km', 'Km to mile']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                onChanged: (text) {
                  input = double.tryParse(text) ?? 0;
                },

                decoration: const InputDecoration(
                  hintText: 'Enter a number',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: convert,
                child: const Text('Convert'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.amber,
              width: double.infinity,
              height: 200,
              child: Center(
                child: FittedBox(
                  child: Text(
                    result.toString(),
                    style: const TextStyle(
                      fontSize: 50.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
