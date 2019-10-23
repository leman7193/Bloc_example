import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/api/db_api.dart';
import 'package:flutter_application/models/category.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter_application/widgets/bloc_provider.dart';

class ProductBloc extends BlocBase {
  List<Product> _products = List();

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
    dbApi.getProducts(category).listen((snapShot) {
      List<Product> tempProducts = List();
      for (DocumentSnapshot doc in snapShot.documents) {
        Product product = Product.fromJson(doc.data);
        product.id = doc.documentID;
        tempProducts.add(product);
      }
      _products.clear();
      _products.addAll(tempProducts);
      _inProducts.add(_products);
    });
  }
}
