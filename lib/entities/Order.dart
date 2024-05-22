import 'ProductInPurchase.dart';
import 'User.dart';

class Order{

  int? id;
  DateTime? purchaseTime;
  User? buyer;
  List<ProductInPurchase>? productInPurchase;
  DateTime? expectedDelivery;
  String? deliveryAddress;

//<editor-fold desc="Data Methods">
  Order({
    this.id,
    this.purchaseTime,
    this.buyer,
    this.productInPurchase,
    this.expectedDelivery,
    this.deliveryAddress,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Order &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          purchaseTime == other.purchaseTime &&
          buyer == other.buyer &&
          productInPurchase == other.productInPurchase &&
          expectedDelivery == other.expectedDelivery &&
          deliveryAddress == other.deliveryAddress);

  @override
  int get hashCode =>
      id.hashCode ^
      purchaseTime.hashCode ^
      buyer.hashCode ^
      productInPurchase.hashCode ^
      expectedDelivery.hashCode ^
      deliveryAddress.hashCode;

  @override
  String toString() {
    return 'Order{' +
        ' id: $id,' +
        ' purchaseTime: $purchaseTime,' +
        ' buyer: $buyer,' +
        ' productInPurchase: $productInPurchase,' +
        ' expectedDelivery: $expectedDelivery,' +
        ' deliveryAddress: $deliveryAddress,' +
        '}';
  }

  Order copyWith({
    int? id,
    DateTime? purchaseTime,
    User? buyer,
    List<ProductInPurchase>? productInPurchase,
    DateTime? expectedDelivery,
    String? deliveryAddress,
  }) {
    return Order(
      id: id ?? this.id,
      purchaseTime: purchaseTime ?? this.purchaseTime,
      buyer: buyer ?? this.buyer,
      productInPurchase: productInPurchase ?? this.productInPurchase,
      expectedDelivery: expectedDelivery ?? this.expectedDelivery,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'purchaseTime': this.purchaseTime,
      'buyer': this.buyer,
      'productInPurchase': this.productInPurchase,
      'expectedDelivery': this.expectedDelivery,
      'deliveryAddress': this.deliveryAddress,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] as int,
      purchaseTime: map['purchaseTime'] as DateTime,
      buyer: map['buyer'] as User,
      productInPurchase: map['productInPurchase'] as List<ProductInPurchase>,
      expectedDelivery: map['expectedDelivery'] as DateTime,
      deliveryAddress: map['deliveryAddress'] as String,
    );
  }

//</editor-fold>
}