import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';

class MenuItem extends StatefulWidget {
  final AppBloc appBloc;
  FetchListCategories listCategories = FetchListCategories();
  MenuItem({Key key, this.appBloc,}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MenuItemState();
  }
}

class _MenuItemState extends State<MenuItem> {
  @override
  void initState() {
    super.initState();
    _fetchListCategories();
  }

  List<ListCategories> categories = List();
  _fetchListCategories() async {
    var nextCategory = await widget.listCategories.fetchListCategories();
    setState(() {
      categories.addAll(nextCategory);
    });
  }

  _buildButtonMenu(ListCategories category) {
    return Column(
      children: [
        MaterialButton(
          child:
              new CircleAvatar(backgroundImage: NetworkImage(category.image), backgroundColor: Colors.blue,),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductsOfCategories(
                          appBloc: widget.appBloc,
                          id_categories: category.id,
                          name_categories: category.name,
                        )));
          },
          height: 50.0,
          minWidth: 50.0,
        ),
        Container(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text(
            category.name,
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 10.0),
          ),
        )
      ],
    );
  }

  _buildMenuItem() {
    return SliverList(
        delegate: SliverChildListDelegate([
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: categories.map((category) {
          return Container(
            child: _buildButtonMenu(category),
          );
        }).toList()),
      )
    ]));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildMenuItem();
  }
}
