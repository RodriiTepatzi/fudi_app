import 'package:flutter/material.dart';

// Pages 

import 'package:fudi_app/src/views/forgot_password_page.dart';
import 'package:fudi_app/src/views/search_page.dart';
import 'package:fudi_app/src/views/sign_up_page.dart';
import 'package:fudi_app/src/views/tabs_page.dart';
import 'package:fudi_app/src/views/welcome_page.dart';
import 'package:fudi_app/src/views/login_page.dart';

final routes = <String,WidgetBuilder>{
  'welcome' : (BuildContext context) => WelcomePage(),
  'login' : (BuildContext context) => LoginPage(),
  'sign-up' : (BuildContext context) => SignUpPage(),
  'forgot-password' : (BuildContext context) => ForgotPasswordPage(),
  'tabs' : (BuildContext context) => TabsPage(),
  'search' : (BuildContext context) => const SearchPage(),
};