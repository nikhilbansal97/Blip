import 'dart:async';
import 'dart:convert';

import 'package:blip/database/models/currency.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Currency>> fetchLatestTickerData() async {
    String url = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
    http.Response response = await http.get(url);
    List body = json.decode(response.body);
    return body.map((e) => new Currency.fromMap(e)).toList();
  }
}
