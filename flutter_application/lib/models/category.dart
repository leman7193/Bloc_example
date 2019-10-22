class Category {
  static const NAME_KEY = 'name';
  String id;
  String name;

  Category() {
    this.name = "mother board";
  }

  Category.fromFirebase(Map<String, dynamic> json) {
    name = json['name'];
  }
}
