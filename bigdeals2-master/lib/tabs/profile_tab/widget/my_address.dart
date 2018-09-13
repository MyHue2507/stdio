import 'package:bigdeals2/tabs/tabs.dart';

class MyAddress extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(150, 7, 239, 204),
          title: Text('My Address'),
          actions: <Widget>[
            FlatButton(
              child: Text('Add new'),
              onPressed:(){
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddAddress()),
            );
              },
            )
          ],
        ),
      );
    }
}