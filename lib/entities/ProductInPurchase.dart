import 'package:progetto_piattaforme_frontend/entities/Order.dart';
import 'package:progetto_piattaforme_frontend/entities/Product.dart';

class ProductInPurchase{

  int? id;
  int? quantity=1;
  Product? product;

//<editor-fold desc="Data Methods">
  ProductInPurchase({
    this.id,
    this.quantity,
    this.product,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductInPurchase &&
          runtimeType == other.runtimeType &&

          product == other.product);

  @override
  int get hashCode => id.hashCode ^ quantity.hashCode ^ product.hashCode;

  @override
  String toString() {
    return 'ProductInPurchase{' +
        ' id: $id,' +
        ' quantity: $quantity,' +
        ' product: $product,' +
        '}';
  }

  ProductInPurchase copyWith({
    int? id,
    int? quantity,
    Product? product,
  }) {
    return ProductInPurchase(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': this.quantity,
      'product': product?.toJson2(),
    };
  }

  factory ProductInPurchase.fromJson(Map<String, dynamic> map) {
    return ProductInPurchase(
      id: map['id'] as int,
      quantity: map['quantity'] as int,
      product: Product.fromJson(map['product']),
    );
  }

//</editor-fold>
}