import 'package:blip/database/models/currency.dart';
import 'package:floor/floor.dart';

@dao
abstract class CurrencyDAO {
  @insert
  Future<void> insertCurrency(Currency currency);

  @insert
  Future<void> insertAllCurrencies(List<Currency> currencyList);

  @Query("SELECT * FROM CURRENCY")
  Future<List<Currency>> getAllCurrencyInformation();
}
