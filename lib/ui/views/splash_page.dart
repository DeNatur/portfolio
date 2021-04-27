import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/services/cache_service.dart';
import 'package:portfolio/ui/components/loading_page.dart';

import '../../buisness_logic/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/statics/routes.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await CacheService(context).preCacheImagesAndAnimations();
      context.read(navigationProvider).navigateToAndReplaceUntil(MainViewRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingPage(),
    );
  }
}
