import 'package:flutter/material.dart';

// Pages 

import 'package:fudi_app/src/pages/forgot_password_page.dart';
import 'package:fudi_app/src/pages/search_page.dart';
import 'package:fudi_app/src/pages/sign_up_page.dart';
import 'package:fudi_app/src/pages/tabs/tabs_page.dart';
import 'package:fudi_app/src/pages/welcome_page.dart';
import 'package:fudi_app/src/pages/login_page.dart';

final routes = <String,WidgetBuilder>{
  'welcome' : (BuildContext context) => WelcomePage(),
  'login' : (BuildContext context) => LoginPage(),
  'sign-up' : (BuildContext context) => SignUpPage(),
  'forgot-password' : (BuildContext context) => ForgotPasswordPage(),
  'tabs' : (BuildContext context) => TabsPage(),
  'search' : (BuildContext context) => SearchPage(),
};