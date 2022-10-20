import 'dart:developer';

import 'package:flutter/material.dart';

import '../conversions/currency_conversion.dart';

class CurrencyConverter extends StatefulWidget {
  CurrencyConverter({Key? key}) : super(key: key);

  @override
  State<CurrencyConverter> createState() => _CurrencyConverter();
}

class _CurrencyConverter extends State<CurrencyConverter> {
  String topSelected = "INR";
  String bottomSelected = "INR";
  var bottomOutput = " ";
  String topInput = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade700,
          title: const Text("Currency Converter"),
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
                        dropdownColor: Colors.grey,
                        value: topSelected,
                        items: [
                          DropdownMenuItem(
                            child: Text("INR"),
                            value: 'INR',
                          ),
                          DropdownMenuItem(
                            child: Text("DOLLAR"),
                            value: 'DOLLAR',
                          ),
                          DropdownMenuItem(
                            child: Text("POUND"),
                            value: 'POUND',
                          ),
                          DropdownMenuItem(
                            child: Text("EUROS"),
                            value: 'EUROS',
                          ),
                          DropdownMenuItem(
                            child: Text("DINAR"),
                            value: 'DINAR',
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

                            CurrencyConversion cur = new CurrencyConversion(
                                topInput, topSelected, bottomSelected);
                            bottomOutput = cur.calculateCurrencyConversion();
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
                            child: Text("INR"),
                            value: 'INR',
                          ),
                          DropdownMenuItem(
                            child: Text("DOLLOR"),
                            value: 'OLLAR',
                          ),
                          DropdownMenuItem(
                            child: Text("POUND"),
                            value: 'POUND',
                          ),
                          DropdownMenuItem(
                            child: Text("EUROS"),
                            value: 'EUROS',
                          ),
                          DropdownMenuItem(
                            child: Text("DINAR"),
                            value: 'DINAR',
                          ),
                        ],
                        onChanged: (value) {
                          log(value!);
                          setState(() {
                            bottomSelected = value!;

                            if (topInput != " " && bottomOutput != " ") {
                              CurrencyConversion cur = CurrencyConversion(
                                  topInput, topSelected, bottomSelected);
                              bottomOutput = cur.calculateCurrencyConversion();
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
          ]),
        ));
  }
}
