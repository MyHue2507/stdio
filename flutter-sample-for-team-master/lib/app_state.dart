class AppState{
  AppState({this.userName});

  final String userName;

  bool get isLogged => userName != null && userName.isNotEmpty;
}