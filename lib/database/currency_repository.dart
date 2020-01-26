import 'package:blip/database/models/currency.dart';
import 'package:blip/network/api_service.dart';
import 'package:connectivity/connectivity.dart';

import 'database.dart';

class CurrencyRepository {
  CurrencyDatabase _database;
  ApiService apiService;

  Future<void> init() async {
    apiService = ApiService();
    _database = await $FloorCurrencyDatabase
        .databaseBuilder("currency_database.db")
        .build();
  }

  Future<List<Currency>> getCurrencyInformation() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      return _getCurrencyInformationFromLocal();
    } else {
      return _fetchCurrencyInformationFromNetwork();
    }
  }

  Future<List<Currency>> _getCurrencyInformationFromLocal() async {
    return _database.currencyDao.getAllCurrencyInformation();
  }

  Future<List<Currency>> _fetchCurrencyInformationFromNetwork() async {
    List<Currency> currencyList = await apiService.fetchLatestTickerData();
    _saveCurrencyInformation(currencyList);
    return currencyList;
  }

  void _saveCurrencyInformation(List<Currency> currencyList) async {
    await _database.currencyDao.insertAllCurrencies(currencyList);
  }
}
