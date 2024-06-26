import 'package:conversor_de_moedas/app/controllers/home_controller.dart';
import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText, fromText);

  test("deve converter de real para dolar com virgula", () {
    toText.text = "2,0";
    homeController.convert();
    expect(fromText.text, "0.38");
  });

  test("deve converter de real para dólar com ponto", () {
    toText.text = "2.0";
    homeController.convert();
    expect(fromText.text, "0.38");
  });

  test("deve converter de dolar para real", () {
    toText.text = "1.0";
    homeController.toCurrency = CurrencyModel(
        name: 'Dolar', real: 5.35, dolar: 1.0, euro: 0.93, ieni: 157.44);
    homeController.fromCurrency = CurrencyModel(
        name: 'Real', real: 1.0, dolar: 0.19, euro: 0.17, ieni: 29.42);
    homeController.convert();
    expect(fromText.text, "5.35");
  });
}
