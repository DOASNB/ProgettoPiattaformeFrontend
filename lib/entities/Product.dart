import 'package:flutter/foundation.dart';
import 'package:progetto_piattaforme_frontend/support/constants.dart' as constants ;


class Product {
  int? id;
  String? barCode;
  String? name;
  String? description;
  String? imageName;
  double? price;
  int? quantity;
  String? category;




//<editor-fold desc="Data Methods">

  Product({
    this.id,
     this.barCode,
    this.name,
     this.description,
     this.imageName,
     this.price,
     this.quantity,
     this.category,
  });







  @override
  String toString() {
    return 'Product{' +
        ' id: $id,' +
        ' barCode: $barCode,' +
        ' name: $name,' +
        ' description: $description,' +
        ' imageName: $imageName,' +
        ' price: $price,' +
        ' quantity: $quantity,' +
        ' category: $category,' +
        '}';
  }





  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'barCode': this.barCode,
      'name': this.name,
      'description': this.description,
      'imageName': this.imageName,
      'price': this.price,
      'quantity': this.quantity,
      'category': this.category,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {


    Product prodotto =  Product(
      id: map['id'],
      quantity: map['quantity'],
      barCode: map['barCode'],
      name: map['name'],
      description: map['description'],
      imageName: map['imageName'],
      price: map['price'],
      category: map['category']
    );

    return prodotto;
  }



}

