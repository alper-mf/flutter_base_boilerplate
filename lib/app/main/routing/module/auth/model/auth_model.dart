class AuthModel {
  final String? email;
  final String? userName;
  final String? token;

  AuthModel({this.email, this.userName, this.token});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'] as String?,
      userName: json['userName'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['userName'] = userName;
    data['token'] = token;
    return data;
  }

  AuthModel copyWith({
    String? email,
    String? userName,
    String? token,
  }) {
    return AuthModel(
      email: email ?? this.email,
      userName: userName ?? this.userName,
      token: token ?? this.token,
    );
  }

  //toString method
  @override
  String toString() {
    return 'AuthModel{email: $email, userName: $userName, token: $token}';
  }

  //equals method
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthModel &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          userName == other.userName &&
          token == other.token;
}
