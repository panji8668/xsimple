

import 'package:isimple/src/bloc/basebloc.dart';
import 'package:isimple/src/models/isimpleproduct.dart';
import 'package:isimple/src/services/isimpleservice.dart';
import 'package:rxdart/rxdart.dart';

import '../models/api_response.dart';

class ISimpleBloc extends BaseBloc {
  final service = ISimpleService();
  late String baseurl;
  ISimpleBloc({required String burl}) {
    baseurl = burl;
  }
  final _productController =
      BehaviorSubject<ApiResponse<IsimpleProductResponse>>();
  Stream<ApiResponse<IsimpleProductResponse>> get productStream =>
      _productController.stream;
  initGetProducts() {
    _productController.sink.add(ApiResponse.init());
  }

  getProduct() {
    _productController.sink.add(ApiResponse.loading('Loading'));
    service
        .getIProducts(baseurl)
        .then((value) =>
            _productController.sink.add(ApiResponse.completed(value)))
        .catchError((error) =>
            _productController.sink.add(ApiResponse.error(error.toString())));
  }

  @override
  void dispose() {
    _productController.close();
  }

}