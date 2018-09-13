import 'package:bigdeals2/tabs/tabs.dart';

class Sum extends StatefulWidget {
  List<ProductsItem> products = List();
  Sum(this.products);
  @override
  State<StatefulWidget> createState() {
    return _SumState();
  }
}

class _SumState extends State<Sum> {
  int sum() {
    int s = 0;
    if (widget.products?.length ?? 0 > 0) {
      // List<int>.generate(widget.products?.length, (int index) {
      //   print(index);
      //   if (widget.products[index].amount_sale >=
      //       widget.products[index].amount_target)
      //     s + widget.products[index].price_deal;
      //   else
      //     s + widget.products[index].price;
      // });
      for(int i =0 ; i < widget.products?.length ?? 0;i++ ){
          if (widget.products[i].amount_sale >=
            widget.products[i].amount_target)
          s= s + widget.products[i].price_deal;
        else
          s= s + widget.products[i].price;
      }
    }
    print('dddddddddddddddddddddddddddddddddd${s}');
    return s;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return sum() == 0
        ? Container(
            width: 0.0,
            height: 0.0,
          )
        : Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Tổng cộng:'),
                Text(sum().toString()),
              ],
            ),
          );
  }
}
