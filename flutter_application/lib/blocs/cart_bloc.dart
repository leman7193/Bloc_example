import 'dart:async';

import 'package:flutter_application/models/cart.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter_application/widgets/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class CardBloc extends BlocBase{
  Cart _cart = Cart();

  final _productController = BehaviorSubject<List<Product>>();
  Sink<List<Product>> get  _inProducts => _productController.sink;
  Stream<List<Product>> get outProducts => _productController.stream;

  final _countController = BehaviorSubject<int>();
  Sink<int> get _inCount => _countController.sink;
  Stream<int> get outCount => _countController.stream;

  void addProduct(Product product){
    final products = _cart.products;
    if( products.contains(product)){
       products[products.indexOf(product)].amount++;
    }else {
      product.amount = 1;
      products.add(product);
    }
    _cart.itemCount++;
    _inCount.add(_cart.itemCount);
    _inProducts.add(products);
  }

  @override
  void dispose() {
    _productController.close();
    _countController.close();
  }
}