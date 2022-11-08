import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiCalls {

  Future<Response> getAllPosts() async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:8080/post/all');
    var response = await client.get(uri);
    return response;
  }
}