

import 'package:isimple/src/services/baseservice.dart';

import '../models/isimpleproduct.dart';

abstract class BaseISimple {
  Future<IsimpleProductResponse> getIProducts(String baseurl);
}


class ISimpleService extends BaseService implements BaseISimple {
  @override
  Future<IsimpleProductResponse> getIProducts(String baseurl) async {
    httpdio.options.baseUrl = baseurl;
    var resp = await httpdio.get("/xsimple/products?tipe=data");
    return IsimpleProductResponse.fromJson(resp.data);
  }

}