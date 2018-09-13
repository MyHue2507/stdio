// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:bigdeals2/tabs/tabs.dart';

// class AddItemDialog extends StatefulWidget {
//   ProductsItem product ;
//   AddItemDialog(this.product);
//   @override
//   AddItemDialogState createState() {
//     return new AddItemDialogState();
//   }
// }

// class AddItemDialogState extends State<AddItemDialog> {
//   String itemName;
// //  ProductsItem product ;

//   @override
//   Widget build(BuildContext context) {
//     return new StoreConnector<List<ProductsItem>, OnItemAddedCallback>(
//       converter: (store) => (itemName) => store
//           .dispatch(AddItemAction(widget.product)),
//       builder: (context, callback) => new AlertDialog(
//             title: Text('Add Item ?'),
//             actions: <Widget>[
//               new FlatButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: new Text("Cancel")),
//               new FlatButton(
//                   onPressed: () {
//                     callback(itemName);
//                     Navigator.pop(context);
//                   },
//                   child: new Text("Add"))
//             ],
//           ),
//     );
//   }
// }

// typedef OnItemAddedCallback = Function(String itemName);
