import 'dart:ui';

import 'package:covid_vaccination/bloc/form_submission.dart';
import 'package:covid_vaccination/bloc/login/login_bloc.dart';
import 'package:covid_vaccination/bloc/login/login_event.dart';
import 'package:covid_vaccination/bloc/login/login_state.dart';
import 'package:covid_vaccination/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class login extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final inputFieldStyle = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(),
  );
  Widget backgroundImage() {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new ExactAssetImage('assets/images/corona.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: new Container(
          decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
          authrepo: context.read<AuthRepository>(),
        ),
        child: Stack(
          children: [
            backgroundImage(),
            Center(
              child: Container(
                width: 500.0,
                child: _loginForm(),
              ),
            ),
          ],
        ),
      ),
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
            SizedBox(
              height: 20.0,
            ),
            _password(),
            SizedBox(
              height: 20.0,
            ),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _username() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          decoration: inputFieldStyle.copyWith(
            hintText: 'User Name',
          ),
          validator: (value) =>
              state.isValidUsername ? null : 'invalid username',
          //adding event usernamechange
          onChanged: (value) => context.read<LoginBloc>().add(
                usernameChange(username: value),
              ),
        );
      },
    );
  }

  Widget _password() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: inputFieldStyle.copyWith(
            hintText: 'Password',
          ),
          validator: (value) =>
              state.isValidpassword ? null : "invalid password",
          onChanged: (value) => context.read<LoginBloc>().add(
                passwordChange(password: value),
              ),
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator.adaptive()
          : ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  context.read<LoginBloc>().add(loginButtonClick());
                }
              },
              child: Text('Login'),
            );
    });
  }
}
