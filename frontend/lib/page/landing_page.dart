import 'dart:ui';

import 'package:covid_vaccination/screens/login.dart';
import 'package:covid_vaccination/screens/signup.dart';
import 'package:flutter/material.dart';
import '../widget/info_card.dart';

// Data
import '../data/card_data.dart';

// Model
import '../models/card_model.dart';

class LandingPage extends StatelessWidget {
  static const String routeName = '/landingPage';
  final List<CardCatagory> _categories = categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _image(),
          ListView(
            children: [
              introCard(context),
              Container(
                height: 800.0,
                child: Padding(
                  padding: EdgeInsets.only(top: 0, left: 20.0, right: 20.0),
                  child: ListView.builder(
                    itemCount: _categories.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return InfoCard(
                          cardTitle: _categories[index].cardTitle,
                          subTitle: _categories[index].subTitle,
                          description: _categories[index].description);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget introCard(BuildContext context) {
    return Container(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.arrow_drop_down_circle),
              title: const Text('Welcome'),
              subtitle: Text(
                'Covid appointment scheduling',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _text(context),
            ),
          ],
        ),
      ),
    );
  }

  // Widget infoCard() {
  //   return Container(
  //     child: Card(
  //       clipBehavior: Clip.antiAlias,
  //       child: Column(
  //         children: [
  //           ListTile(
  //             leading: Icon(Icons.arrow_drop_down_circle),
  //             title: const Text('Covid Update'),
  //             subtitle: Text(
  //               'New variant - Delta',
  //               style: TextStyle(color: Colors.black.withOpacity(0.6)),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(16.0),
  //             child: Text(
  //               'The Delta variant is more contagious: The Delta variant is highly contagious, more than 2x as contagious as previous variants.Some data suggest the Delta variant might cause more severe illness than previous variants in unvaccinated people. In two different studies from Canada and Scotland, patients infected with the Delta variant were more likely to be hospitalized than patients infected with Alpha or the original virus that causes COVID-19. Even so, the vast majority of hospitalization and death caused by COVID-19 are in unvaccinated people.',
  //               style: TextStyle(color: Colors.black.withOpacity(0.6)),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _image() {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new ExactAssetImage('assets/images/vaccine.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: new Container(
          decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
        ),
      ),
    );
  }

  Widget _text(BuildContext context) {
    final textStyle =
        TextStyle(fontSize: 20.0, color: Colors.black.withOpacity(0.6));
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "This App is designed to make Covid Vaccination easier.We will try our best to get you your appointment as soon as possible",
            style: textStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            " Sign up to set your schedule.",
            style: textStyle,
          ),
          SizedBox(
            height: 10,
          ),
          SignupButton(context),
          Text(
            "If you don't have an account.",
            style: textStyle,
          ),
          SizedBox(
            height: 10,
          ),
          LoginButton(context)
        ],
      ),
    );
  }

  Widget SignupButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          final signup = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Signup(),
            ),
          );
          // Signup.routeName
        },
        child: Text("Sign up"),
      ),
    );
  }

  Widget LoginButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          final login = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          );
          // Login.routeName);
        },
        child: Text("Login"),
      ),
    );
  }
}
