import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../conversions/mass_conversion.dart';

class MassConverter extends StatefulWidget {
  const MassConverter({Key? key}) : super(key: key);

  @override
  State<MassConverter> createState() => _MassConverterState();
}

class _MassConverterState extends State<MassConverter> {
  String topSelected = "Kilogram";
  String bottomSelected = "Kilogram";
  var bottomOutput = " ";
  String topInput = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade700,
          title: const Text(
            "Mass Converter",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(14.5)),
              child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(12),
                      child: DropdownButton<String>(
                          dropdownColor: Colors.grey,
                          value: topSelected,
                          items: const [
                            DropdownMenuItem(
                              child: Text("Kilogram"),
                              value: 'Kilogram',
                            ),
                            DropdownMenuItem(
                              child: Text("Pound"),
                              value: 'Pound',
                            ),
                            DropdownMenuItem(
                              child: Text("Ounce"),
                              value: 'Ounce',
                            ),
                            DropdownMenuItem(
                              child: Text("Gram"),
                              value: 'Gram',
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              topSelected = value!;
                            });
                          }),
                    ),
                    Container(
                        margin: EdgeInsets.all(12),
                        color: Colors.grey,
                        child: TextField(
                          textAlign: TextAlign.center,
                          autofocus: true,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            setState(() {
                              topInput = text;

                              MassConversion mass = new MassConversion(
                                  topInput, topSelected, bottomSelected);
                              bottomOutput = mass.calculateConversion();
                            });
                          },
                        )),
                    Container(
                      margin: EdgeInsets.all(12),
                      child: DropdownButton<String>(
                          dropdownColor: Colors.grey,
                          value: bottomSelected,
                          items: const [
                            DropdownMenuItem(
                              child: Text("Kilogram"),
                              value: 'Kilogram',
                            ),
                            DropdownMenuItem(
                              child: Text("Pound"),
                              value: 'Pound',
                            ),
                            DropdownMenuItem(
                              child: Text("Ounce"),
                              value: 'Ounce',
                            ),
                            DropdownMenuItem(
                              child: Text("Gram"),
                              value: 'Gram',
                            ),
                          ],
                          onChanged: (value) {
                            log(value!);
                            setState(() {
                              bottomSelected = value!;

                              if (topInput != " " && bottomOutput != " ") {
                                MassConversion mass = new MassConversion(
                                    topInput, topSelected, bottomSelected);
                                bottomOutput = mass.calculateConversion();
                              }
                            });
                          }),
                    ),
                    Container(
                        margin: EdgeInsets.all(12),
                        color: Colors.grey,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          padding: EdgeInsets.all(17),
                          child: Text(bottomOutput,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          color: Colors.grey,
                        ))
                  ])),
            ),
          ]),
        ));
  }
}
