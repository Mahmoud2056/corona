import 'package:flutter/material.dart';
import '../models/app_localizations.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class MainScreen extends StatefulWidget {
  static const route = "/mainScreen";
  final Function changeLocale;
  MainScreen({this.changeLocale});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.8],
            colors: [Color(0xFF8FDBB8), Color(0xFF51b5D8)],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Image.asset(
                    "assets/images/electropi1++.png",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  _buildSubmitButton(
                      context,
                      AppLocalizations.of(context).translate('signup'),
                      SignupScreen.route),
                  _buildSubmitButton(
                      context,
                      AppLocalizations.of(context).translate('login'),
                      LoginScreen.route),
                  _buildSubmitButton(context,
                      AppLocalizations.of(context).translate('language'), null),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(context, title, route) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ButtonTheme(
        buttonColor: Colors.white70,
        minWidth: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.08,
        child: RaisedButton(
          textColor: Color(0xFF45746E),
          onPressed: () {
            if (route != null)
              Navigator.of(context).pushNamed(route);
            else {
              if (AppLocalizations.of(context).translate('language') ==
                  "English") {
                widget.changeLocale(Locale('en', 'US'));
              } else {
                widget.changeLocale(Locale('ar', 'EG'));
              }
            }
          },
          child: Text(title),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
            side: BorderSide(color: Color(0xFF45746E)),
          ),
        ),
      ),
    );
  }
}
