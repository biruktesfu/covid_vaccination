import 'package:covid_vaccination/page/landing_page.dart';
import 'package:covid_vaccination/repository/authentication_repository.dart';
import 'package:covid_vaccination/repository/auth_repo_signup.dart';
import 'package:covid_vaccination/screens/login.dart';
import 'package:covid_vaccination/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LandingPage.routeName,
      routes: {
        Login.routeName: (BuildContext context) => Signup(),
        Signup.routeName: (BuildContext context) => Signup(),
        LandingPage.routeName: (BuildContext context) => LandingPage(),
      },
    );
  }
}
