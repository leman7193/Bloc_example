import 'dart:convert';

class Product {
  Product.create(this.name);

  String name;
  String id;
  int amount;
  Product({this.name, this.id, this.amount});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        id: json["id"],
        amount: json["amout"],
      );
  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  @override
  bool operator ==(o) => o is Product && o.name == name && o.id == id;

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
