import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikn_code/api/api.dart';

class SalesService {
  final url = "${Api().saleList}";

  Future SalesList() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    final token = _pref.get('token');
    print(token);

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'content-type': 'application/json',
        'Authorization': 'Bearer ${token}'
      });
    } catch (e) {
      print(e);
    }
  }
}
