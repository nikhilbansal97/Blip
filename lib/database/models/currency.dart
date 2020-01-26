import 'package:floor/floor.dart';

@Entity(tableName: "currency")
class Currency {
  Currency(this.code, this.name, this.price);

  /*
  * The declaration of the member variables should be in the
  * same order as the constructor for floor package to create mapper correctly!
  */
  String code;
  String name;
  String price;

  /*
  * Added in bottom of all the member variables as floor package tries to
  * map the member variables with the constructor parameters. This creates a
  * problem with database queries.
  */
  @PrimaryKey(autoGenerate: true)
  int id;

  Currency.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    code = map['symbol'];
    price = map['price_usd'];
  }
}
