import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';

class HomeScreen extends StatefulWidget {
  final AppBloc appBloc;
  HomeScreen({Key key, this.appBloc}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(150, 7, 239, 204),
        title: Text("GroupBuy"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>SearchScreen(appBloc: widget.appBloc)),
            );
          },)
        ],
      ),
        body: Center(
      child: ListItem(
        appBloc: widget.appBloc
      ),
    ));
  }
}
