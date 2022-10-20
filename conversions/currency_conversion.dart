import 'package:flutter/cupertino.dart';

class CurrencyConversion {
  final String topValue;
  final String topSelected;
  final String bottomSelected;

  CurrencyConversion(this.topValue, this.topSelected, this.bottomSelected);

  calculateCurrencyConversion() {
    if (topSelected == "INR") {
      if (bottomSelected == "INR") {
        return topValue;
      } else if (bottomSelected == "POUND") {
        double topInput = double.parse(topValue);
        double result = topInput * 0.0108;
        return result.toString();
      } else if (bottomSelected == "DOLLAR") {
        double topInput = double.parse(topValue);
        double result = topInput * 0.0124;
        return result.toString();
      } else if (bottomSelected == "EUROS") {
        double topInput = double.parse(topValue);
        double result = topInput * 0.0214;
        return result.toString();
      } else if (bottomSelected == "DINAR") {
        double topInput = double.parse(topValue);
        double result = topInput * 0.0038;
        return result.toString();
      }

    }
    if (topSelected == "POUND") {
      if (bottomSelected == "POUND") {
        return topValue;
      } else if (bottomSelected == "INR") {
        double topInput = double.parse(topValue);
        double result = topInput * 92.956;
        return result.toString();
      } else if (bottomSelected == "DOLLAR") {
        double topInput = double.parse(topValue);
        double result = topInput * 1.128;
        return result.toString();
      } else if (bottomSelected == "EUROS") {
        double topInput = double.parse(topValue);
        double result = topInput * 1.1484;
        return result.toString();
      } else if (bottomSelected == "DINAR") {
        double topInput = double.parse(topValue);
        double result = topInput * 0.4125;
        return result.toString();
      }
    }
    if (topSelected == "DOLLAR") {
      if (bottomSelected == "DOLLAR") {
        return topValue;
      } else if (bottomSelected == "INR") {
        double topInput = double.parse(topValue);
        double result = topInput * 82.375;
        return result.toString();
      } else if (bottomSelected == "POUND") {
        double topInput = double.parse(topValue);
        double result = topInput * 0.8861;
        return result.toString();
      } else if (bottomSelected == "EUROS") {
        double topInput = double.parse(topValue);
        double result = topInput * 1.0176;
        return result.toString();
      } else if (bottomSelected == "DINAR") {
        double topInput = double.parse(topValue);
        double result = topInput * 3.37;
        return result.toString();
      }
    }
    if (topSelected == "EUROS") {
      if (bottomSelected == "EUROS") {
        return topValue;
      } else if (bottomSelected == "INR") {
        double topInput = double.parse(topValue);
        double result = topInput * 80.944;
        return result.toString();
      } else if (bottomSelected == "POUND") {
        double topInput = double.parse(topValue);
        double result = topInput * 0.87;
        return result.toString();
      } else if (bottomSelected == "DOLLAR") {
        double topInput = double.parse(topValue);
        double result = topInput * 0.981;
        return result.toString();
      } else if (bottomSelected == "DINAR") {
        double topInput = double.parse(topValue);
        double result = topInput * 0.3048;
        return result.toString();
      }
    }

    if (topSelected == "DINAR") {
      if (bottomSelected == "DINAR") {
        return topValue;
      } else if (bottomSelected == "INR") {
        double topInput = double.parse(topValue);
        double result = topInput * 265.6;
        return result.toString();
      } else if (bottomSelected == "POUND") {
        double topInput = double.parse(topValue);
        double result = topInput * 2.857;
        return result.toString();
      } else if (bottomSelected == "DOLLAR") {
        double topInput = double.parse(topValue);
        double result = topInput * 3.37;
        return result.toString();
      } else if (bottomSelected == "EUROS") {
        double topInput = double.parse(topValue);
        double result = topInput * 3.2811;
        return result.toString();
      }
    }
  }
}
