import 'package:http/http.dart' as http;

class HttpRepo {
  static final url = Uri.parse('http://10.145.220.206');
  final client = http.Client(); // reuse this client

  Future<bool> isTooClose() async {
    bool content = false;

    await client.get(url).then((response) {
      final body = response.body;
      if (body.isNotEmpty && body.contains('true')) {
        content = true;
      }
    });

    return content;
  }
}
