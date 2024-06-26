// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:conversor_de_moedas/app/controllers/home_controller.dart';
import 'package:conversor_de_moedas/components/currency_box.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController toText = TextEditingController();
  TextEditingController fromText = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText, fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.only(top: 150, bottom: 20, left: 30, right: 30),
            child: Column(
              children: [
                Image.asset(
                  'assets/currencies.png',
                  width: 200,
                  height: 200,
                  color: Colors.amber[700],
                ),
                SizedBox(
                  height: 90,
                ),
                CurrencyBox(
                  selectedItem: homeController.toCurrency!,
                  controller: toText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CurrencyBox(
                  selectedItem: homeController.fromCurrency!,
                  controller: fromText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model;
                    });
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      homeController.convert();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        backgroundColor: Colors.amber),
                    child: Text(
                      'CONVERTER',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
