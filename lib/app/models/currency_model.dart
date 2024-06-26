class CurrencyModel {
  final String name;
  final double real;
  final double dolar;
  final double euro;
  final double ieni;

  CurrencyModel(
      {required this.name,
      required this.real,
      required this.dolar,
      required this.euro,
      required this.ieni});

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel(
          name: 'Real', real: 1.0, dolar: 0.19, euro: 0.17, ieni: 29.42),
      CurrencyModel(
          name: 'Dolar', real: 5.35, dolar: 1.0, euro: 0.93, ieni: 157.44),
      CurrencyModel(
          name: 'Euro', real: 5.72, dolar: 1.07, euro: 1.0, ieni: 168.81),
      CurrencyModel(
          name: 'Ieni', real: 0.034, dolar: 0.0064, euro: 0.0059, ieni: 1)
    ];
  }
}
