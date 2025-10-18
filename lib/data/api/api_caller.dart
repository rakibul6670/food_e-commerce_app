import 'dart:convert';
import 'package:http/http.dart' as http;


class APICaller {

  //------------------------- Fetch Data -------------------
  static Future fetchData(Uri url) async{
    try{
      //-----------sent response in server ------------
      final response = await http.get(url);

      if(response.statusCode == 200){
        return jsonDecode(response.body);
      }
      else{
        throw Exception("Data get failed");
      }

    }
    catch(e){
      throw Exception(e.toString());
    }
  }

}