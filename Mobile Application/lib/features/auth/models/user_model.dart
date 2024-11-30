class UserModel{
  final int? id;
  final String? email;
  final String? name;
  final String? password;
  final String? phone;

  UserModel({this.id, this.email, this.name, this.password, this.phone});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'password': password,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      email: map['email'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
      phone: map['phone'] as String,
    );
  }
}