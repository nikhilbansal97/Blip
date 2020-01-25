import 'package:blip/network/api_service.dart';
import 'package:flutter/material.dart';

class CurrencyListPage extends StatefulWidget {
  CurrencyListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _CurrencyListPageState();
  }
}

class _CurrencyListPageState extends State<CurrencyListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: MaterialButton(
          child: Text("Fetch data from API!"),
          onPressed: () {
            ApiService.fetchLatestExchangeRates();
          },
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}
