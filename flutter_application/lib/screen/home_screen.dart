import 'package:flutter/material.dart';
import 'package:flutter_application/blocs/category_bloc.dart';
import 'package:flutter_application/blocs/product_bloc.dart';
import 'package:flutter_application/models/category.dart';
import 'package:flutter_application/screen/selected_category_sceen.dart';
import 'package:flutter_application/widgets/bloc_provider.dart';
import 'package:flutter_application/widgets/cart_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CategoryBloc _categoryBloc = BlocProvider.of<CategoryBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce'),
        actions: <Widget>[
          CartButton(),
        ],
      ),
      body: StreamBuilder<List<Category>>(
        stream: _categoryBloc.outCategories,
        builder: (context, categories) {
          if (categories.hasData) {
            return ListView.builder(
              itemCount: categories.data.length,
              itemBuilder: (context, index) {
                final category = categories.data[index];
                return ListTile(
                  onTap: () => navigateToSelectedCategory(context, category),
                  title: Text(
                    category.name,
                    style: TextStyle(fontSize: 24.0),
                  ),
                );
              },
            );
          } else {
            return Text('NO DATA');
          }
        },
      ),
    );
  }

  void navigateToSelectedCategory(BuildContext context, Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider<ProductBloc>(
          bloc: ProductBloc(category),
          child: SelectedCategoryScreen(),
        ),
      ),
    );
  }
}
