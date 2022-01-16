import 'package:http/http.dart' as http;

const baseUrl = "http://localhost:8080";

class API {
  static Future getColaborador() async {
    var url = baseUrl + "/usuarios";
    return await http.get(url);
  }
}
