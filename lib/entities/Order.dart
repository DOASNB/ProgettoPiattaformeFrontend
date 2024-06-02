import 'ProductInPurchase.dart';
import 'User.dart';

class Order{

  int? id;
  DateTime? purchaseTime;
  User? buyer;
  List<ProductInPurchase>? productsInPurchase;

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'purchaseTime': this.purchaseTime,
      'buyer': this.buyer,
      'productsInPurchase': productsInPurchase?.map((p) => p.toJson()).toList(),
    };
  }

  factory Order.fromJson(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      purchaseTime: DateTime.fromMillisecondsSinceEpoch(map['purchaseTime']),
      buyer: User.fromJson(map['buyer']),
      productsInPurchase: (map['productsInPurchase'] as List<dynamic>).map((jsonItem){
        return ProductInPurchase.fromJson(jsonItem as Map<String,dynamic>);
      }).toList(),
    );
  }

//<editor-fold desc="Data Methods">
  Order({
    this.id,
    this.purchaseTime,
    this.buyer,
    this.productsInPurchase,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Order &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          purchaseTime == other.purchaseTime &&
          buyer == other.buyer &&
          productsInPurchase == other.productsInPurchase);

  @override
  int get hashCode =>
      id.hashCode ^
      purchaseTime.hashCode ^
      buyer.hashCode ^
      productsInPurchase.hashCode;

  @override
  String toString() {
    return 'Order{' +
        ' id: $id,' +
        ' purchaseTime: $purchaseTime,' +
        ' buyer: $buyer,' +
        ' productsInPurchase: $productsInPurchase,' +
        '}';
  }

  Order copyWith({
    int? id,
    DateTime? purchaseTime,
    User? buyer,
    List<ProductInPurchase>? productsInPurchase,
  }) {
    return Order(
      id: id ?? this.id,
      purchaseTime: purchaseTime ?? this.purchaseTime,
      buyer: buyer ?? this.buyer,
      productsInPurchase: productsInPurchase ?? this.productsInPurchase,
    );
  }



//</editor-fold>
}