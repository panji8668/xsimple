import 'package:dio/dio.dart';

class BaseService {
  final httpdio = Dio();

  BaseService() {
    httpdio.options.contentType = Headers.jsonContentType;
  }
}
