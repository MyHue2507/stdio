import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';
class SilverAppBar extends StatelessWidget {
  AppBloc appBloc ;
  @override
    Widget build(BuildContext context) {
      return  SliverAppBar(
      backgroundColor: Color.fromARGB(150, 7, 239, 204),
      pinned: false,
      floating: false,
      expandedHeight: 100.0,
      title: Container(
        margin: EdgeInsets.only(bottom: 50.0),
        child: Text(
          'Group Buy',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      centerTitle: true,
      flexibleSpace: const FlexibleSpaceBar(
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(left: 70.0, right: 70.0, top: 60.0),
            child: Card(
              child: InkWell(
                child: TextField(
                  obscureText: true,
                  decoration: (InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      size: 15.0,
                    ),
                    border: InputBorder.none,
                    hintText: 'Search...', hintStyle: TextStyle(fontSize: 10.0),
                    contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    // border: OutlineInputBorder()
                  )),
                ),
              ),
            ),
          )),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.list),
          onPressed: () {
             
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>SearchScreen(appBloc: appBloc)),
            );
          },
        ),
      ],
    );;
    }
}
