import 'package:flutter/material.dart';
import 'package:portfolio/ui/projects/projects_page.dart';
import 'package:portfolio/ui/start/start_page.dart';
import 'package:portfolio/utils/statics/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case StartViewRoute:
      return _getPageRoute(routeName: settings.name, viewToShow: StartPage());
    case ProjcetsViewRoute:
      return _getPageRoute(
          routeName: settings.name, viewToShow: ProjectsPage());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}

PageRoute _getPageRouteWithArgs(
    {String routeName, Widget viewToShow, dynamic arguments}) {
  return MaterialPageRoute(
      settings: RouteSettings(name: routeName, arguments: arguments),
      builder: (_) => viewToShow);
}
