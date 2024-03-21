import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.host, this.route, this.queryParams);

  final String host;
  final String route;
  final Map<String, dynamic> queryParams;

  Future getData() async {
    Response res = await get(Uri.https(host, route, queryParams));

    if (res.statusCode == 200) {
      var source = jsonDecode(res.body);
      return source;
    } else {
      var code = res.statusCode;
      print("$res: gave $code status code");
    }
  }
}
