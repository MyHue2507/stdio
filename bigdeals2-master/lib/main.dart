import 'package:bigdeals2/app.dart';
import 'package:bigdeals2/app_bloc.dart';
import 'package:bigdeals2/tabs/tabs.dart';

void main() {
  AppBloc appBloc = AppBloc();
  FetchSlide slide = FetchSlide() ;
  FetchListCategories listCategories = FetchListCategories();
  FetchHomePage homePage = FetchHomePage();
  FetchCategory category = FetchCategory() ;
  runApp(new MyApp(appBloc: appBloc,slide: slide,listCategories: listCategories,homePage: homePage,category: category,));
}

