class User {

  int? id;
  String? firstname;
  String? lastname;
  String? teleponeNumber;
  String? email;
  String? address;

  User({this.id, this.firstname, this.lastname, this.teleponeNumber, this.email,
      this.address});


  User.empty();


  @override
  String toString() {
    return 'User{id: $id, firstname: $firstname, lastname: $lastname, teleponeNumber: $teleponeNumber, email: $email, address: $address}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'teleponeNumber': teleponeNumber,
      'email': email,
      'address': address,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      teleponeNumber: map['teleponeNumber'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
    );
  }
}