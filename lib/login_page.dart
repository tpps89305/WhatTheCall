import 'package:flutter/material.dart';
import 'helpers/constants.dart';

// 1
class LoginPage extends StatelessWidget {
  // 2
  final _pinCodeController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);
  // 3
  @override
  Widget build(BuildContext context) {
    // 3a
    final logo = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: bigRadius,
      child: appLogo,
    );
    // 3b
    final pinCode = TextFormField(
      controller: _pinCodeController,
      keyboardType: TextInputType.phone,
      maxLength: 4,
      maxLines: 1,
      autofocus: true,
      decoration: InputDecoration(
          hintText: pinCodeHintText,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          hintStyle: const TextStyle(color: Colors.white)),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
    // 3c
    final loginButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: loginButtonStyle,
        onPressed: () {
          Navigator.of(context).pushNamed(homePageTag);
        },
        child:
            const Text(loginButtonText, style: TextStyle(color: Colors.white)),
      ),
    );
    // 3d
    return Scaffold(
      backgroundColor: appDarkGreyColor,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            const SizedBox(height: bigRadius),
            pinCode,
            const SizedBox(height: buttonHeight),
            loginButton
          ],
        ),
      ),
    );
  }
}
