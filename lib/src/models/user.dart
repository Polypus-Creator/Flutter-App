class User {
  String username;
  String email;
  DateTime createDate;

  User({
    required this.username,
    required this.email,
    required this.createDate,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return new User(
      username: map['username'] as String,
      email: map['email'] as String,
      createDate: map['create_date'] as DateTime,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'username': this.username,
      'email': this.email,
      'create_date': this.createDate,
    } as Map<String, dynamic>;
  }
}
