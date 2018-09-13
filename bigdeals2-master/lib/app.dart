import 'package:bigdeals2/app_bloc.dart';
import 'package:bigdeals2/tabs/tabs.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:bigdeals2/splash/splash.dart';

class MyApp extends StatefulWidget {
  final AppBloc appBloc;
  FetchSlide slide ;
  FetchListCategories listCategories ;
  FetchHomePage homePage ;
  FetchCategory category ;
  MyApp({
    Key key,
    this.appBloc,this.slide,this.listCategories,this.homePage,this.category,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyState();
  }
}

class _MyState extends State<MyApp> {
  final Store<AppStateCart> store = Store<AppStateCart>(
    appReducer,
    initialState: AppStateCart.initial(),
  );
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          accentColor: Colors.red,
        ),
        initialRoute: "/splash",
        routes: {
          "/splash": (context) => SplashScreen(),
          "/welcome": (context) => WelcomeScreen(),
          "/": (context) => TabsScreen(appBloc: widget.appBloc,slide: widget.slide,listCategories: widget.listCategories,homePage: widget.homePage,category: widget.category,),
          "/logged": (context) => LoggedScreen(appBloc: widget.appBloc),
          "/changePassword": (context) => ChangePassWord(),
          "/my address": (context) => MyAddress(),
          "/Orders History": (context) => OrdersHistory(),
        },
      ),
    );
  }
}
