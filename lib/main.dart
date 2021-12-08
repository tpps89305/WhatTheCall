import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'helpers/constants.dart';

void main() => runApp(ContactlyApp());

class ContactlyApp extends StatelessWidget {
  ContactlyApp({Key? key}) : super(key: key);

  final routes = <String, WidgetBuilder>{
    loginPageTag: (context) => LoginPage(),
    homePageTag: (context) => HomePage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(primaryColor: appDarkGreyColor),
      home: LoginPage(),
      routes: routes,
    );
  }
}
