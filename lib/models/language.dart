import 'package:flutter/material.dart';

abstract class Language {
  static Language of(BuildContext context) {
    return Localizations.of(context, Language);
  }

  String get appTitle;
  String get pinCodeHintText;
  String get loginButtonText;
  String get name;
  String get address;
}

class LanguageEn extends Language {
  @override
  String get address => "Address";

  @override
  String get appTitle => "Contactly";

  @override
  String get loginButtonText => "Login";

  @override
  String get name => "Name";

  @override
  String get pinCodeHintText => "Pin Code";
}

class LanguageZh extends Language {
  @override
  String get address => "地址";

  @override
  String get appTitle => "通訊錄";

  @override
  String get loginButtonText => "登入";

  @override
  String get name => "姓名";

  @override
  String get pinCodeHintText => "密碼";

}
