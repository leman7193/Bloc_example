import 'package:flutter/material.dart';
import 'package:flutter_application/blocs/cart_bloc.dart';
import 'package:flutter_application/blocs/product_bloc.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter_application/widgets/bloc_provider.dart';
import 'package:flutter_application/widgets/cart_button.dart';

class SelectedCategoryScreen extends StatelessWidget {
  const SelectedCategoryScreen({Key key}) : super();

  @override
  Widget build(BuildContext context) {
    final ProductBloc _productBloc = BlocProvider.of<ProductBloc>(context);
    final _cartBloc = BlocProvider.of<CardBloc>(context);
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            CartButton(),
          ],
        ),
        body: StreamBuilder<List<Product>>(
          stream: _productBloc.outProducts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  final product = snapshot.data[index];
                  return InkWell(
                    onTap: () => _cartBloc.addProduct(product),
                    child: Center(child: Text(product.name)),
                  );
                },
              );
            }
            return SizedBox();
          },
        ));
  }
}
