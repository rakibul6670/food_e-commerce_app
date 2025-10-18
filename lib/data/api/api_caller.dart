import 'dart:convert';
import 'package:http/http.dart' as http;

class APICaller {
  //------------------------- Fetch Data -------------------
  static Future fetchData(Uri url) async {
    try {
      //-----------sent response in server ------------
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["recipes"];
      } else {
        throw Exception("Data get failed");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
