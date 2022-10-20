import 'dart:developer';

import 'package:flutter/material.dart';

import '../conversions/length_conversion.dart';

class LengthConverter extends StatefulWidget {
  LengthConverter({Key? key}) : super(key: key);

  @override
  State<LengthConverter> createState() => _LengthConverterState();
}

class _LengthConverterState extends State<LengthConverter> {
  String topSelected = "Kilometer";
  String bottomSelected = "Kilometer";
  var bottomOutput = " ";
  String topInput = " " ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade700,
          title: const Text("Length Converter"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(12),
                        child: DropdownButton<String>(
                            dropdownColor: Colors.grey.shade500,
                            value: topSelected,
                            items:  [
                              DropdownMenuItem(
                                child: Text("Kilometer"),
                                value: 'Kilometer',
                              ),
                              DropdownMenuItem(
                                child: Text("Meter"),
                                value: 'Meter',
                              ),
                              DropdownMenuItem(
                                child: Text("Centimeter"),
                                value: 'Centimeter',
                              ),
                              DropdownMenuItem(
                                child: Text("Foot"),
                                value: 'Foot',
                              ),
                              DropdownMenuItem(
                                child: Text("Inch"),
                                value: 'Inch',
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                topSelected = value!;
                              });
                            }),
                      ),
                      Container(
                          margin: EdgeInsets.all(12),
                          color: Colors.grey.shade500,
                          child: TextField(
                            textAlign: TextAlign.center,
                            autofocus: true,
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.number,
                            onChanged: (text) {
                              setState(() {
                                topInput = text;

                                LengthConversion l = new LengthConversion(topInput, topSelected, bottomSelected);
                                bottomOutput = l.calculateLengthConversion();
                              });
                            },
                          )),
                      Container(
                        margin: EdgeInsets.all(12),
                        child: DropdownButton<String>(
                            dropdownColor: Colors.grey,
                            value: bottomSelected,
                            items:  [
                              DropdownMenuItem(
                                child: Text("Kilometer"),
                                value: 'Kilometer',
                              ),
                              DropdownMenuItem(
                                child: Text("Meter"),
                                value: 'Meter',
                              ),
                              DropdownMenuItem(
                                child: Text("Centimeter"),
                                value: 'Centimeter',
                              ),
                              DropdownMenuItem(
                                child: Text("Foot"),
                                value: 'Foot',
                              ),
                              DropdownMenuItem(
                                child: Text("Inch"),
                                value: 'Inch',
                              ),
                            ],
                            onChanged: (value) {
                              log(value!);
                              setState(() {
                                bottomSelected = value!;

                                if (topInput != " " && bottomOutput != " ") {
                                  LengthConversion l = new LengthConversion(
                                      topInput, topSelected, bottomSelected);
                                  bottomOutput = l.calculateLengthConversion();
                                }
                              });
                            }),
                      ),
                      Container(
                          margin: EdgeInsets.all(12),
                          color: Colors.grey,
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Container(padding: EdgeInsets.all(17),
                            child: Text(bottomOutput,textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                            color: Colors.grey,
                          ))
                    ])),
          ]),
        ));
  }
}
