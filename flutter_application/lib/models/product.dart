import 'dart:convert';

class Product {
  Product.create(this.name);

  String name;
  String imageUrl;
  String id;
  int amount;
  Product({this.name, this.imageUrl, this.id, this.amount});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        imageUrl: json["imageUrl"],
        id: json["id"],
        amount: json["amout"],
      );
  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  @override
  bool operator ==(o) => o is Product && o.name == name && o.id == id;

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
