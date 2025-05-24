import 'package:http/http.dart' as http;

class HttpRepo {

  static final url = Uri.parse('');

  Future<bool> isTooClose() async {
    bool content = false;

    http.get(url).then((response) {
      final body = response.body;
      if (body.isNotEmpty && body.contains('true')) {
        content = true;
      }
    });

    return content;
  }

}
