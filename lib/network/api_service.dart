import 'package:blip/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static void fetchLatestExchangeRates() {
    String url = _createUrlForLatestPosts();
    Future<http.Response> response = http.get(url);
    response.then((value) => {print(value.body)});
  }

  static String _createUrlForLatestPosts() {
    return "$BASE_URL/$PATH_API/$PATH_LATEST?$PARAM_ACCESS_KEY=$ACCESS_KEY";
  }
}
