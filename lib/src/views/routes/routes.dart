import 'package:flutter/material.dart';

// Pages 

import 'package:fudi_app/src/views/pages/forgot_password_page.dart';
import 'package:fudi_app/src/views/pages/otp_page.dart';
import 'package:fudi_app/src/views/pages/search_page.dart';
import 'package:fudi_app/src/views/pages/sign_up_page.dart';
import 'package:fudi_app/src/views/pages/tabs_page.dart';
import 'package:fudi_app/src/views/pages/welcome_page.dart';
import 'package:fudi_app/src/views/pages/login_page.dart';

final routes = <String,WidgetBuilder>{
  'welcome' : (BuildContext context) => WelcomePage(),
  'login' : (BuildContext context) => LoginPage(),
  'sign-up' : (BuildContext context) => SignUpPage(),
  'forgot-password' : (BuildContext context) => ForgotPasswordPage(),
  'tabs' : (BuildContext context) => TabsPage(),
  'search' : (BuildContext context) => const SearchPage(),
  'otp-code' : (BuildContext context) => OTPPage(),
};