class Product {
  int? id;
  String? code;
  String? name;
  String? description;
  String? image;
  double? price;
  int? quantity;
  int? category;
  bool? favorite;

  Product.empty();

  Product({
    this.id,
    this.code,
    this.category,
    this.description,
    this.name,
    this.image,
    this.price,
    this.quantity,
    this.favorite
});



  @override
  String toString() {
    return 'Product{id: $id, code: $code, name: $name, description: $description, image: $image, price: $price, quantity: $quantity, category: $category}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'quantity': quantity,
      'category': category,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      code: map['code'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as int,
      category: map['category'] as int,
    );
  }
}