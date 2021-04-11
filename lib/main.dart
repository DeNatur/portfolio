import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/ui/views/main_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'utils/statics/colors.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Szymon Stasik Portfolio',
        theme: ThemeData(
          backgroundColor: PortfolioColors.radialBgStart,
          scaffoldBackgroundColor: PortfolioColors.radialBgStart,
          textTheme: GoogleFonts.robotoCondensedTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: MainPage());
  }
}
