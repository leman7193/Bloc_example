import 'package:flutter/material.dart';
import 'package:flutter_application/blocs/cart_bloc.dart';
import 'package:flutter_application/screen/cart_screen.dart';
import 'package:flutter_application/widgets/bloc_provider.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cardBloc = BlocProvider.of<CardBloc>(context);
    return Stack(
      children: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => CartScreen(),
            ));
          },
          icon: Icon(Icons.shopping_cart),
        ),
        Positioned(
          top: 5.0,
          right: 5.0,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.red,
            child: StreamBuilder<int>(
              stream: _cardBloc.outCount,
              initialData: 0,
              builder: (context, snapshot) {
                return Text(
                  snapshot.data.toString(),
                  style: TextStyle(fontSize: 12),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
