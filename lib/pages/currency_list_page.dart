import 'package:blip/models/currency.dart';
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
  List<Currency> _currencyList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchLatestCurrencyInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          _buildCurrencyList(_currencyList),
          _buildLoadingIndicator(isLoading)
        ],
      ),
    );
  }

  void _fetchLatestCurrencyInformation() {
    setState(() {
      isLoading = true;
    });
    Future<List<Currency>> future = ApiService.fetchLatestTickerData();
    future.asStream().listen((value) {
      _updateCurrencyList(value);
    });
  }

  void _updateCurrencyList(List<Currency> value) {
    setState(() {
      isLoading = false;
      _currencyList = value;
    });
  }

  ListView _buildCurrencyList(List<Currency> currencyList) {
    return ListView.builder(
      itemCount: currencyList.length,
      itemBuilder: (context, index) {
        return _buildCurrencyListItem(currencyList[index]);
      },
    );
  }

  Widget _buildLoadingIndicator(bool isVisible) {
    return Center(
      child: Visibility(
        visible: isVisible,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildCurrencyListItem(Currency currency) {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildBlackTextView(currency.name),
          _buildBlackTextView(currency.price),
        ],
      ),
    );
  }

  Widget _buildBlackTextView(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.black, fontSize: 16.0),
    );
  }
}
