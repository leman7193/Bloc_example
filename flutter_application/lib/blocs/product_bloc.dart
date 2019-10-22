import 'dart:async';

import 'package:flutter_application/api/db_api.dart';
import 'package:flutter_application/models/category.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter_application/widgets/bloc_provider.dart';

class ProductBloc extends BlocBase {
  List<Product> _products;

  StreamController<List<Product>> _productController =
      StreamController<List<Product>>();
  Sink<List<Product>> get _inProducts => _productController.sink;
  Stream<List<Product>> get outProducts => _productController.stream;

  ProductBloc(Category category) {
    getProducts(category);
  }

  @override
  void dispose() {
    _productController.close();
  }

  void getProducts(Category category) {
    DbAPi dbApi = DbAPi();
    _products = dbApi.getProducts(category);
    _inProducts.add(_products);
  }
}
