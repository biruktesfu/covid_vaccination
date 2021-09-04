import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget backgroundImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/vaccination.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            backgroundImage(),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  var username = TextEditingController();
  var pass = TextEditingController();

  Widget formfield(var control, bool hideText, String label) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      child: TextFormField(
        controller: control,
        obscureText: hideText,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }

  Widget loginButton() {
    return ElevatedButton(
      onPressed: () => {
        if (username.text == "" || pass.text == "")
          {
            print("please fill the form"),
          }
        else
          {
            print("hurray"),
          }
      },
      child: Icon(Icons.login_sharp),
    );
  }

  @override
  void dispose() {
    //cleanup controller

    username.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Column(
        children: [
          formfield(username, false, "User Name"),
          formfield(pass, true, "Password"),
          loginButton(),
        ],
      ),
    );
  }
}
