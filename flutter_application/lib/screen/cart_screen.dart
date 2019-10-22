import 'package:flutter/material.dart';
import 'package:flutter_application/blocs/cart_bloc.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter_application/widgets/bloc_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cardBloc = BlocProvider.of<CardBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: StreamBuilder<List<Product>>(
        stream: _cardBloc.outProducts,
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data.isNotEmpty) {
            // display items
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (builder, index){
                final product = snapshot.data[index];
                return ListTile(
                  title: Text(product.name),
                  trailing: Text(product.amount.toString()),
                );
              },
            );
          } else {
            return Center(
              child: Text('no items in cart'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
