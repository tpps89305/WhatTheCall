import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:what_the_call/models/localizations_delegate.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'helpers/constants.dart';

void main() => runApp(ContactlyApp());

class ContactlyApp extends StatelessWidget {
  ContactlyApp({Key? key}) : super(key: key);

  final routes = <String, WidgetBuilder>{
    loginPageTag: (context) => LoginPage(),
    homePageTag: (context) => const HomePage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contactly", // 這個地方不能用 Language.of(context)
      theme: ThemeData(primaryColor: appDarkGreyColor),
      home: LoginPage(),
      routes: routes,
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant')
      ],
    );
  }
}
