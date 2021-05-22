import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/services/firebase_service.dart';
import 'package:portfolio/ui/components/loading_page.dart';
import 'package:portfolio/ui/views/main_page.dart';
import 'package:portfolio/ui/views/splash_page.dart';
import 'package:portfolio/utils/locale_delegate.dart';
import 'package:portfolio/utils/router.dart';

import 'buisness_logic/providers.dart';
import 'utils/statics/colors.dart';

void main() {
  Paint.enableDithering = true; //Helps getting smooth gradient transition
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends HookWidget {
  MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // if (useProvider(firebaseService).error) {
    //   return MaterialApp(home: Scaffold(body: Text("Something went wrong")));
    // }

    // if (!useProvider(firebaseService).initialized) {
    //   return MaterialApp(home: Scaffold(body: LoadingPage()));
    // }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Szymon Stasik Portfolio',
        theme: ThemeData(
          fontFamily: "RobotoCondensed",
          backgroundColor: PortfolioColors.radialBgStart,
          scaffoldBackgroundColor: PortfolioColors.radialBgStart,
        ),
        localizationsDelegates: [
          const LocDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''), // English, no country code
        ],
        onGenerateRoute: generateRoute,
        navigatorKey: useProvider(navigationProvider).navigationKey,
        home: SplashPage());
  }
}
