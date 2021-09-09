import 'package:covid_vaccination/bloc/form_submission.dart';
import 'package:covid_vaccination/bloc/signup/signup_bloc.dart';
import 'package:covid_vaccination/bloc/signup/signup_event.dart';
import 'package:covid_vaccination/bloc/signup/signup_state.dart';
import 'package:covid_vaccination/repository/auth_repo_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signup extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final inputFieldStyle = InputDecoration(
    border: OutlineInputBorder(),
  );

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

  Widget _username() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return TextFormField(
          decoration: inputFieldStyle.copyWith(hintText: "User Name"),
          validator: (value) =>
              state.isValidusername ? null : "invalid username",
          onChanged: (value) => context.read<SignupBloc>().add(
                usernameChange(username: value),
              ),
        );
      },
    );
  }

  Widget _phonenumber() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return TextFormField(
            decoration: inputFieldStyle.copyWith(hintText: "Phone Number"),
            validator: (value) =>
                state.isValidphonenumber ? null : "invalid phone number",
            onChanged: (value) => context.read<SignupBloc>().add(
                  phonenumberChange(phonenumber: value),
                ));
      },
    );
  }

  Widget _password() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: inputFieldStyle.copyWith(
            hintText: "Password",
          ),
          validator: (value) =>
              state.isValidPassword ? null : "invalid password",
          onChanged: (value) => context.read<SignupBloc>().add(
                passwordChange(password: value),
              ),
        );
      },
    );
  }

  Widget _confirmpassword() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: inputFieldStyle.copyWith(
            hintText: "Confirm Pasword",
          ),
          validator: (value) =>
              state.confirmPassword ? null : "password dont match",
          onChanged: (value) => context.read<SignupBloc>().add(
                retypepasswordChange(retypepassword: value),
              ),
        );
      },
    );
  }

  Widget _signupButton() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? CircularProgressIndicator.adaptive()
            : ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    context.read<SignupBloc>().add(SignupButtonClick());
                  }
                },
                child: Text("Signup"),
              );
      },
    );
  }
}
