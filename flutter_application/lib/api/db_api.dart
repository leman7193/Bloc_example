import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/models/category.dart';
import 'package:flutter_application/models/product.dart';

class DbAPi {
  Stream<QuerySnapshot> getCategories() {
    Firestore db = Firestore.instance;
    try {
      Stream<QuerySnapshot> querySnapshot =
          db.collection('Categories').snapshots();
      return querySnapshot;    
    } catch (e) {
      print(e);
    }
  }

  List<Product> getProducts(Category category) {
    List<Product> tempList = [
      Product.create('Product 1'),
      Product.create('Product 2'),
      Product.create('Product 3')
    ];
    return tempList;
  }
}
