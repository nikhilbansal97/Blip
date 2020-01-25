class Currency {
  Currency(this.code, this.name, this.price);

  String name;
  String code;
  String price;

  Currency.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    code = map['symbol'];
    price = map['price_usd'];
  }
}
