class authRepoAdmin {
  Future<void> admin() async {
    print("attempting schedule");
    Future.delayed(Duration(seconds: 2));
    print("schedule posted");
  }
}
