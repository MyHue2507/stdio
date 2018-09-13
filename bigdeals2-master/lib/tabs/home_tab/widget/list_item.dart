import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';

class ListItem extends StatefulWidget {
  final AppBloc appBloc;
  FetchHomePage homePage ;
  FetchCategory category ;
  FetchSlide slide ;
  FetchListCategories listCategories ;
  ListItem({Key key, this.appBloc,this.slide,this.listCategories,this.homePage,this.category}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ListItemState();
  }
}

class _ListItemState extends State<ListItem> {
  @override
  void initState() {
    super.initState();
    _loadNextPage();
  }

  bool _isLoading = false;
  int _currentPage = 1;
  int _pageSize = 1;
  List<CategaryItem> categary = List();
  LoadingState _loadingState = LoadingState.LOADING;
  _loadNextPage() async {
    _isLoading = true;
    try {
      var nextCategary =
          await widget.homePage.fechHomePage(_currentPage, _pageSize);
      setState(() {
        _loadingState = LoadingState.DONE;
        categary.addAll(nextCategary);
        _isLoading = false;
        if (_pageSize != 5) {
          _pageSize++;
        } else {
          _currentPage++;
          _pageSize = 1;
        }
      });
    } catch (e) {
      _isLoading = false;
      if (_loadingState == LoadingState.LOADING) {
        setState(() => _loadingState = LoadingState.ERROR);
      }
    }
  }

  _buildItemList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        CategaryItem item = categary[index] ?? CategaryItem();
        if (!_isLoading &&
            index >= (categary.length - 1) &&
            categary.length != 0) {
          _loadNextPage();
        }
        var children = [
          Container(
            child: ListCategory(categary: categary[index],appBloc: widget.appBloc,)
          ),
        ];
        if (item.products != null && item.products.length > 0)
          children.addAll(
            item.products.map((product) {
              return Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: ModelProductsItem(product: product ,appBloc: widget.appBloc,),
              );
            }).toList(),
          );
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: children);
      }, childCount: categary?.length ?? 0),
    );
  }

  _getContentSection() {
    switch (_loadingState) {
      case LoadingState.DONE:
        return CustomScrollView(
          slivers: [
            SilverAppBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                SliderImage(slide: widget.slide),
              ]),
            ),

            MenuItem(
              appBloc: widget.appBloc,listCategories: widget.listCategories,category: widget.category,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Divider(
                height: 10.0,
              )
            ])),
            _buildItemList()
          ],
        );
      case LoadingState.ERROR:
        return Text('Sorry, there was an error loading the data!');
      case LoadingState.LOADING:
        return CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getContentSection();
  }
}
