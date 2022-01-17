class User {
  int? id;
  final String email;
  final String password;

  User({
    this.id,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, password: $password}';
  }
}
