class SignUpRequest {
  final String name;
  final String email;
  final String password;
  SignUpRequest(
      {required this.email, required this.password, required this.name});
}

class LoginRequest {
  final String username;
  final String password;
  LoginRequest({required this.password, required this.username});
}
