class AuthRepo {

  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<bool> signup(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<bool> forgotPassword(String email) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<bool> logout() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<bool> resetPassword(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
  Future<bool> refreshToken() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}