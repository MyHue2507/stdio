import 'dart:async';
import 'package:bigdeals2/app_bloc.dart';
import 'package:bigdeals2/app_state.dart';
import 'package:bigdeals2/tabs/tabs.dart';

class TabsScreen extends StatefulWidget {
  final AppBloc appBloc;
  FetchSlide slide ;
  FetchListCategories listCategories ;
  FetchCategory category ;
  FetchHomePage homePage ;

  TabsScreen({Key key, this.appBloc,this.slide,this.listCategories,this.homePage,this.category,}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;
  bool _isLogged = false;

  StreamSubscription<AppState> userSubcription;
  @override
  void initState() {
    super.initState();
    setState(() {
      widget.appBloc.updateUser(AppState(widget.appBloc.getIsLoading()));
      userSubcription = widget.appBloc.appState.listen((s) {
        if (s.isLogged != _isLogged) {
          setState(() {
            _isLogged = s.isLogged;
          });
        }
      });
    });
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    userSubcription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        accentColor: Colors.red,
      ),
      home: Scaffold(
        bottomNavigationBar: Material(
            color: Colors.white,
            child: Container(
              height: 40.0,
              child: TabBar(
                controller: controller,
                tabs: <Tab>[
                  Tab(icon: Icon(Icons.home, color: Colors.grey)),
                  Tab(icon: Icon(Icons.shopping_cart, color: Colors.grey)),
                  Tab(icon: Icon(Icons.perm_identity, color: Colors.grey))
                ],
              ),
            )),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            HomeScreen(appBloc: widget.appBloc,slide: widget.slide,listCategories: widget.listCategories,homePage: widget.homePage,category: widget.category,),
            CartScreen(),
            _isLogged
                ? LoggedScreen(
                    appBloc: widget.appBloc,
                  )
                : ProfileScreen(appBloc: widget.appBloc)
          ],
        ),
      ),
    );
  }
}
