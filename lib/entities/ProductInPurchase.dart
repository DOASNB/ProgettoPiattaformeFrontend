import 'package:progetto_piattaforme_frontend/entities/Order.dart';
import 'package:progetto_piattaforme_frontend/entities/product.dart';

class ProductInPurchase{

  int? id;
  int? quantity;
  Product? product;
  Order? order;


  ProductInPurchase({
    this.id,
    this.quantity,
    this.product,
    this.order,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductInPurchase &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          quantity == other.quantity &&
          product == other.product &&
          order == other.order);

  @override
  int get hashCode =>
      id.hashCode ^ quantity.hashCode ^ product.hashCode ^ order.hashCode;

  @override
  String toString() {
    return 'ProductInPurchase{' +
        ' id: $id,' +
        ' quantity: $quantity,' +
        ' product: $product,' +
        ' order: $order,' +
        '}';
  }

  ProductInPurchase copyWith({
    int? id,
    int? quantity,
    Product? product,
    Order? order,
  }) {
    return ProductInPurchase(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'quantity': this.quantity,
      'product': this.product,
      'order': this.order,
    };
  }

  factory ProductInPurchase.fromMap(Map<String, dynamic> map) {
    return ProductInPurchase(
      id: map['id'] as int,
      quantity: map['quantity'] as int,
      product: map['product'] as Product,
      order: map['order'] as Order,
    );
  }


}