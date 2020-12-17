import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/services/service_locator.dart';
import 'package:portfolio/services/service_navigation.dart';
import 'package:portfolio/ui/start/start_page.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Szymon Stasik Portfolio',
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        navigatorKey: locator<NavigationService>().navigationKey,
        home: StartPage());
  }
}
