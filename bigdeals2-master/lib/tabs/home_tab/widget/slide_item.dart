import 'package:bigdeals2/tabs/tabs.dart';

class TopItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TopItemState();
  }
}

class _TopItemState extends State<TopItem> {
  pageView() {
    final PageController controller = new PageController();
    return Container(
      height: 150.0,
      color: Color(0xFFEEEEEE),
      child: PageView(
        children: <Widget>[
          // WalkThroughHome(
          //   image: 'images/topItem1.jpg',
          // ),
          WalkThroughHome(
            image: 'images/topItem2.jpg',
          ),
          WalkThroughHome(
            image: 'images/topItem3.jpg',
          ),
          WalkThroughHome(
            image: 'images/topItem4.jpg',
          ),
        ],
        controller: controller,
      ),
    );
  }

  _buildTopItem() {
    return SliverList(
      delegate: SliverChildListDelegate([pageView()]),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildTopItem();
  }
}
