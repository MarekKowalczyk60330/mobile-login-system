class AuthService {
  static const _email = 'test@test.com';
  static const _password = 'Test1234';

  static bool checkCredentials(String email, String password) {
    return email.trim() == _email && password == _password;
  }
}