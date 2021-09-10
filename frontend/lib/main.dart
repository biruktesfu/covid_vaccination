import 'package:covid_vaccination/repository/authentication_repository.dart';
import 'package:covid_vaccination/repository/auth_repo_signup.dart';
import 'package:covid_vaccination/screens/login.dart';
import 'package:covid_vaccination/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Home',
      home: FirstScreen(),
    ),
  );
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Covid-Scheduling App'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 60,
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => login()));
              },
              child: const Text('Login'),
            ),
          ),
          Container(
            height: 60,
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => signup()));
              },
              child: const Text('Sigup'),
            ),
          )
        ],
      )),
    );
  }
}
