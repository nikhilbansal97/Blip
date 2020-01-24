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
        child: Text("Hi from Currency List page!"),
      ),
    );
  }
}
