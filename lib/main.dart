import 'package:flutter/material.dart';
import 'login_page.dart';
import 'helpers/constants.dart';

void main() => runApp(const ContactlyApp());

class ContactlyApp extends StatelessWidget {
  const ContactlyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(primaryColor: appDarkGreyColor),
      home: LoginPage(),
    );
  }
}
