import 'package:flutter/material.dart';

Color appDarkGreyColor = Color.fromRGBO(58, 66, 86, 1.0);
Color appGreyColor = Color.fromRGBO(64, 75, 96, .0);

const appTitle = "Contactly";
const pinCodeHintText = "Pin Code";
const loginButtonText = "Login";

Image appLogo = Image.asset('assets/images/flutter-logo-round.png');

const bigRadius = 66.0;
const buttonHeight = 24.0;

final ButtonStyle loginButtonStyle = ElevatedButton.styleFrom(
    primary: appDarkGreyColor,
    padding: const EdgeInsets.all(12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ));

const loginPageTag = 'Login Page';
const homePageTag = 'Home Page';
