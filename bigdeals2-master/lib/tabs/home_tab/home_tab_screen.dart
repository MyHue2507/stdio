import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';

class HomeScreen extends StatefulWidget {
  final AppBloc appBloc;
  FetchSlide slide ;
  FetchListCategories listCategories ;
  FetchHomePage homePage ;
  FetchCategory category ;
  HomeScreen({Key key, this.appBloc,this.slide,this.listCategories,this.homePage,this.category}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListItem(
        appBloc: widget.appBloc,slide: widget.slide,listCategories: widget.listCategories,homePage: widget.homePage,category: widget.category,
      ),
    ));
  }
}
