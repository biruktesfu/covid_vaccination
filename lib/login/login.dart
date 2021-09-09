import 'package:flutter/material.dart';

class login extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginForm(),
    );
  }

  //this widget contains username, password and button widgets
  Widget _loginForm() {
    //used form to validate the child widgets.
    return Form(
      //because of this key the forms have validator argument
      key: _formkey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _username(),
            _password(),
            _button(),
          ],
        ),
      ),
    );
  }

  Widget _username() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'username',
      ),
      validator: (value) => null,
    );
  }

  Widget _password() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'password',
      ),
    );
  }

  Widget _button() {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Login'),
    );
  }
}
