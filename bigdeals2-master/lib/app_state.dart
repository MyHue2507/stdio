class AppState {
  AppState(this.isLogin);

  final bool isLogin;
  final bool isEmpty ;

  bool get isLogged => isLogin == true;
//  bool get isCart => isEmpty == true ;

  
}
