import 'package:flutter/material.dart';
import 'package:quantity_converter_app/ui/currency.dart';
import 'package:quantity_converter_app/ui/length.dart';
import 'package:quantity_converter_app/ui/mass.dart';
import 'package:quantity_converter_app/ui/temperature.dart';

const List<String> list = <String>[
  'Length ',
  'Temperature ',
  'Mass ',
  'Currency '
];

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MaterialApp(
    home: QuantityConverter(),
  ));
}

class QuantityConverter extends StatefulWidget {
  const QuantityConverter({Key? key}) : super(key: key);

  @override
  State<QuantityConverter> createState() => _QuantityConverterState();
}

class _QuantityConverterState extends State<QuantityConverter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: const Text("My Unit Converter", textAlign: TextAlign.center),
      ),
      body: InkWell(
        child: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.1), color: Colors.white),
          child: ListView.builder(
              itemCount: list.length,

              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.5),
                    color: Colors.grey.shade400,
                  ),
                  child: Card(
                    elevation: 7,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.5),
                          border: Border.all(
                              color: Colors.grey.shade400,
                              style: BorderStyle.solid)),
                      child: ListTile(
                          tileColor: Colors.white,
                          minVerticalPadding: 30,
                          title: Text(
                            list[index],
                            style: TextStyle(fontSize: 18),
                          ),
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => unitClass[index],)
                            ,
                              )),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

List unitClass = [
  LengthConverter(),
  TemperatureConverter(),
  MassConverter(),
  CurrencyConverter(),
];
