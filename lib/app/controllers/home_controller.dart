import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  late List<CurrencyModel> currencies;
  CurrencyModel? toCurrency;
  CurrencyModel? fromCurrency;
  final TextEditingController toText;
  final TextEditingController fromText;

  HomeController(this.toText, this.fromText) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 0.0;
    double returnValue = 0.0;

    if (fromCurrency!.name == "Real") {
      returnValue = value * toCurrency!.real;
    } else if (fromCurrency!.name == "Dolar") {
      returnValue = value * toCurrency!.dolar;
    } else if (fromCurrency!.name == "Euro") {
      returnValue = value * toCurrency!.euro;
    } else if (fromCurrency!.name == "Ieni") {
      returnValue = value * toCurrency!.ieni;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
