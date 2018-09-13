import 'package:flutter/widgets.dart';
import 'package:bigdeals2/tabs/cart_tab/list_cart.dart';


class CartInherited extends InheritedWidget{
  final ListCart listCart;

  CartInherited({Key key, Widget child,ListCart listCart}):
  this.listCart = listCart ?? ListCart(),
  super(key:key, child:child);
  
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ListCart of(BuildContext context) =>
   (context.inheritFromWidgetOfExactType(CartInherited) as CartInherited).listCart;

}