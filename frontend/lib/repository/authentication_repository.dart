class AuthRepository {
  Future<void> login() async {
    print("attempting login");
    Future.delayed(Duration(seconds: 2));
    print("logged in ");
  }
}
