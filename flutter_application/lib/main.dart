import 'package:flutter/material.dart';
import 'package:flutter_application/blocs/category_bloc.dart';
import 'package:flutter_application/screen/home_screen.dart';
import 'package:flutter_application/widgets/bloc_provider.dart';

import 'blocs/cart_bloc.dart';

void main() => runApp(
      (BlocProvider<CardBloc>(
        child: MyApp(),
        bloc: CardBloc(),
      )),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CategoryBloc>(
        bloc: CategoryBloc(),
        child: HomePage(),
      ),
    );
  }
}
