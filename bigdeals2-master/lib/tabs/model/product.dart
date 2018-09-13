import 'package:meta/meta.dart';
class ProductsItem {
  int id;
  String name;
   int current_deal_id ;
  String description;
  String avatar_image;
  // DateTime  time_start ;
  int time_end;
  int price_deal;
  int price;
  int amount_target;
  int amount_sale;
  ProductsItem(
      {@required this.id,
      @required this.name,
      @required this.avatar_image,
      @required this.price,
      @required this.time_end,
      @required this.price_deal,
      @required this.amount_target,
      @required this.amount_sale,
      @required this.description,
      @required this.current_deal_id});
  factory ProductsItem.internalFromJson(Map jsonMap) {
    return ProductsItem(
      id: jsonMap["id"] as int,
      name: jsonMap["name"] as String,
      avatar_image: jsonMap["avatar_image"] as String,
      time_end: jsonMap["time_end"] as int,
      price: jsonMap["price"] as int,
      price_deal: jsonMap["price_deal"] as int,
      amount_target: jsonMap["amount_target"] as int,
      amount_sale: jsonMap["amount_sale"] as int,
      description: jsonMap["description"] as String,
      current_deal_id: jsonMap["current_deal_id"] as int ,
    );
  }
}
