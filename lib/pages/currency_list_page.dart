import 'package:blip/database/currency_repository.dart';
import 'package:blip/database/models/currency.dart';
import 'package:flutter/material.dart';

class CurrencyListPage extends StatefulWidget {
  CurrencyListPage({Key key, this.title}) : super(key: key);

  final String title;
  final CurrencyRepository repository = CurrencyRepository();

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
    _init();
  }

  void _init() async {
    await widget.repository.init();
    await _fetchLatestCurrencyInformation();
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

  Future<void> _fetchLatestCurrencyInformation() {
    setState(() {
      isLoading = true;
    });
    Future<List<Currency>> future = widget.repository.getCurrencyInformation();
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
