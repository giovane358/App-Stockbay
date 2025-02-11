class User {
  final String token;
  final String? login; // Agora pode ser nulo
  final String? password; // Agora pode ser nulo

  User({required this.token, this.login, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'] ?? '', // Garante que o token nunca seja nulo
      login: json['login'] ?? '', // Se não existir, coloca string vazia
      password: json['password'] ?? '', // Se não existir, coloca string vazia
    );
  }
}
