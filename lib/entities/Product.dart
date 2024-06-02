

class Product {
  int? id;
  String? barCode;
  String? name;
  String? description;
  String? imageName;
  double? price;
  int? quantity;
  int? version;

//<editor-fold desc="Data Methods">

  Product({
    this.id,
    this.barCode,
    this.name,
    this.description,
    this.imageName,
    this.price,
    this.quantity,
    this.version,
  });

//<ed@override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Product &&
              runtimeType == other.runtimeType &&

              barCode == other.barCode

          );


  @override
  int get hashCode =>
      id.hashCode ^
      barCode.hashCode ^
      name.hashCode ^
      description.hashCode ^
      imageName.hashCode ^
      price.hashCode ^
      quantity.hashCode ^
      version.hashCode;


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
        ' version: $version,' +
        '}';
  }


  Product copyWith({
    int? id,
    String? barCode,
    String? name,
    String? description,
    String? imageName,
    double? price,
    int? quantity,
    int? version,
  }) {
    return Product(
      id: id ?? this.id,
      barCode: barCode ?? this.barCode,
      name: name ?? this.name,
      description: description ?? this.description,
      imageName: imageName ?? this.imageName,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      version: version ?? this.version,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'barCode': this.barCode,
      'name': this.name,
      'description': this.description,
      'imageName': this.imageName,
      'price': this.price,
      'quantity': this.quantity,
      'version': this.version,
    };
  }

  Map<String, dynamic> toJson2() {
    return {
      'id': this.id,
      'barCode': this.barCode,
    };
  }

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      barCode: map['barCode'],
      name: map['name'],
      description: map['description'] ,
      imageName: map['imageName'],
      price: map['price'] ,
      quantity: map['quantity'] ,
      version: map['version'],
    );
  }



}

