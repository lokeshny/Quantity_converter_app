import 'package:flutter/material.dart';

import '../conversions/temperature_conversion.dart';

class TemperatureConverter extends StatefulWidget {
  TemperatureConverter({Key? key}) : super(key: key);

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  String topSelected = 'Celsius';
  String bottomSelected = 'Celsius';
  var bottomOutput = " ";
  var topInput = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade700,
        title: const Text("Temperature converter"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        child: DropdownButton<String>(
                            value: topSelected,
                            items: const [
                              DropdownMenuItem(
                                value: 'Celsius',
                                child: Text("Celsius"),
                              ),
                              DropdownMenuItem(
                                value: 'Farenheit',
                                child: Text("Farenheit"),
                              ),
                              DropdownMenuItem(
                                value: 'Kelvin',
                                child: Text("Kelvin"),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                topSelected = value!;
                              });
                            })),
                    Container(
                        color: Colors.grey,
                        child: TextField(
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            topInput = text;
                            setState(() {
                              topInput = text;
                              TemperatureConversion temprature =
                                  new TemperatureConversion(
                                      topSelected, bottomSelected, topInput);
                              bottomOutput = temprature.calculateConversion();
                            });
                            print(text);
                          },
                        )),
                    Container(
                        child: DropdownButton<String>(
                            value: bottomSelected,
                            items: const [
                              DropdownMenuItem(
                                value: 'Celsius',
                                child: Text("Celsius"),
                              ),
                              DropdownMenuItem(
                                value: 'Farenheit',
                                child: Text("Farenheit"),
                              ),
                              DropdownMenuItem(
                                value: 'Kelvin',
                                child: Text("Kelvin"),
                              ),
                            ],
                            onChanged: (value) {
                              bottomSelected = value!;

                              setState(() {
                                bottomSelected = value!;

                                if (topInput != " " && bottomOutput != " ") {
                                  TemperatureConversion temperature =
                                      TemperatureConversion(topInput,
                                          topSelected, bottomSelected);
                                  bottomOutput =
                                      temperature.calculateConversion();
                                }
                              });
                            })),
                    Container(
                        color: Colors.grey,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(bottomOutput,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          color: Colors.grey,
                        ))
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
