import 'package:http/http.dart' as http;

class Request {
  Future<dynamic> get(String link) async {
    var res = await http.get(
      Uri.encodeFull(link),
      headers: {"Accept": "application/json"},
    );

    if (res.statusCode == 200) {
      return res.body;
    }
  }
}
