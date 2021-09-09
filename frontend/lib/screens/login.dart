import 'package:covid_vaccination/bloc/form_submission.dart';
import 'package:covid_vaccination/bloc/login/login_bloc.dart';
import 'package:covid_vaccination/bloc/login/login_event.dart';
import 'package:covid_vaccination/bloc/login/login_state.dart';
import 'package:covid_vaccination/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class login extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
          authrepo: context.read<AuthRepository>(),
        ),
        child: _loginForm(),
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
            _password(),
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
          decoration: InputDecoration(
            hintText: 'Username',
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
          decoration: InputDecoration(
            hintText: 'password',
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
