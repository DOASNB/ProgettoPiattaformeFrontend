class User {

  int? id;
  String? firstName;
  String? lastName;
  String? telephoneNumber;
  String? email;
  String? address;


  User.empty();

//<editor-fold desc="Data Methods">
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.telephoneNumber,
    this.email,
    this.address,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          telephoneNumber == other.telephoneNumber &&
          email == other.email &&
          address == other.address);

  @override
  int get hashCode =>
      id.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      telephoneNumber.hashCode ^
      email.hashCode ^
      address.hashCode;

  @override
  String toString() {
    return 'User{' +
        ' id: $id,' +
        ' firstName: $firstName,' +
        ' lastName: $lastName,' +
        ' telephoneNumber: $telephoneNumber,' +
        ' email: $email,' +
        ' address: $address,' +
        '}';
  }

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? telephoneNumber,
    String? email,
    String? address,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      telephoneNumber: telephoneNumber ?? this.telephoneNumber,
      email: email ?? this.email,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'firstName': this.firstName,
      'lastName': this.lastName,
      'telephoneNumber': this.telephoneNumber,
      'email': this.email,
      'address': this.address,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      telephoneNumber: map['telephoneNumber'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
    );
  }

//</editor-fold>
}