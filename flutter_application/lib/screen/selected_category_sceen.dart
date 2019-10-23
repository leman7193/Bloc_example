import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
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
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            CartButton(),
          ],
        ),
        body: StreamBuilder<List<Product>>(
          stream: _productBloc.outProducts,
          builder: (context, snapshot) {
            if(snapshot.hasError) {
              return Text(snapshot.error);
            }
            switch(snapshot.connectionState){
              case ConnectionState.waiting: 
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  final product = snapshot.data[index];
                  return Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => _cartBloc.addProduct(product),
                            child: Center(
                              child: Text(product.name,
                              style: theme.primaryTextTheme.title.copyWith(color: Colors.black),)
                              ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            if (snapshot.hasData) {
            }
            return SizedBox();
          },
        ));
  }
}
