import 'dart:async';

import 'package:blip/database/dao/currency_dao.dart';
import 'package:blip/database/models/currency.dart';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Currency])
abstract class CurrencyDatabase extends FloorDatabase {
  CurrencyDAO get currencyDao;
}
