import 'package:bigdeals2/tabs/tabs.dart';

class ListCart { 
  List<ProductsItem> checkedProducts = List();
  List<ProductsItem> addProduct(ProductsItem product) {
    checkedProducts.add(product);
    return checkedProducts ;
  }

  List<ProductsItem> removeProduct(ProductsItem product) {
    checkedProducts.remove(product);
    return  checkedProducts ;
  }

  List<ProductsItem> getList() {
    if (checkedProducts?.length == 0)
      return null;
    else
      return checkedProducts;
  }
}
