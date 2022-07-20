import 'package:dio/dio.dart';

class HttpClient {
  Dio dio = Dio();
  static Dio withOption() {
    return Dio(BaseOptions(baseUrl: 'http://172.21.88.148:8000/api',headers: {'Content-Type' : 'application/json'}));
  }
}
