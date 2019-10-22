import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/api/db_api.dart';
import 'package:flutter_application/models/category.dart';
import 'package:flutter_application/widgets/bloc_provider.dart';

class CategoryBloc implements BlocBase {
  List<Category> _categories =  List();

  StreamController<List<Category>> _categoriesController =
      StreamController<List<Category>>();
  Sink<List<Category>> get _inCategories => _categoriesController.sink;
  Stream<List<Category>> get outCategories => _categoriesController.stream;

  CategoryBloc() {
    _getCategories();
  }

  void _getCategories() {
    DbAPi dbApi = DbAPi();
    dbApi.getCategories().listen((snapShot){
      List<Category> tempCategories = List();
      for(DocumentSnapshot doc in snapShot.documents){
        Category category = Category.fromFirebase(doc.data);
        category.id = doc.documentID;
        tempCategories.add(category);
      }
      _categories.clear();
      _categories.addAll(tempCategories);
      _inCategories.add(_categories);
    });
  }

  @override
  void dispose() {
    _categoriesController.close();
  }
}
