import 'package:covid_vaccination/bloc/form_submission.dart';
import 'package:covid_vaccination/bloc/signup/signup_bloc.dart';
import 'package:covid_vaccination/bloc/signup/signup_event.dart';
import 'package:covid_vaccination/bloc/signup/signup_state.dart';
import 'package:covid_vaccination/repository/auth_repo_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: BlocProvider(
      create: (context) => SignupBloc(
        authreposignup: context.read<AuthRepositorysignup>(),
      ),
      child: _signupform(),
    ),
  );
}

Widget _signupform() {
  return Form(
    key: _formkey,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _fullname(),
          SizedBox(
            height: 20.0,
          ),
          _phonenumber(),
          SizedBox(
            height: 20.0,
          ),
          _username(),
          SizedBox(
            height: 20.0,
          ),
          _password(),
          SizedBox(
            height: 20.0,
          ),
          _confirmpassword(),
          SizedBox(
            height: 20.0,
          ),
          _signupButton(),
        ],
      ),
    ),
  );
}

Widget _fullname() {
  return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
    return TextFormField(
      decoration: inputFieldStyle.copyWith(hintText: "Full Name"),
      validator: (value) => state.isvalidfullname ? null : 'invalid name',
      onChanged: (value) => context.read<SignupBloc>().add(
            fullnameChange(fullname: value),
          ),
    );
  });
}
