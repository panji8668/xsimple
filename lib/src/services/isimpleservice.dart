

import 'package:flutter/foundation.dart';
import 'package:isimple/src/services/baseservice.dart';

import '../models/isimpleproduct.dart';

abstract class BaseISimple {
  Future<IsimpleProductResponse> getIProducts(String baseurl,String paket);
}


class ISimpleService extends BaseService implements BaseISimple {
  ISimpleService(super.authtoken);

  @override
  Future<IsimpleProductResponse> getIProducts(String baseurl,String tipe) async {
    httpdio.options.baseUrl = baseurl;
    httpdio.options.headers["auth"] = "Bearer $authtoken";
    var resp = await httpdio.get("/api/v1/isimple/produk?phone=&category=$tipe");
    if (kDebugMode) {
      print(resp);
    }
    return IsimpleProductResponse.fromJson(resp.data);
  }

}