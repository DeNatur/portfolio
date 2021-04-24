import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/services/cache_service.dart';

import '../../buisness_logic/providers.dart';
import '../../utils/statics/asset_names.dart';
import '../../utils/statics/asset_names.dart';
import '../../utils/statics/asset_names.dart';
import '../../utils/statics/asset_names.dart';
import '../../utils/statics/asset_names.dart';
import '../../utils/statics/asset_names.dart';
import '../../utils/statics/colors.dart';
import '../../utils/statics/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/statics/colors.dart';
import '../../utils/statics/colors.dart';
import '../../utils/statics/colors.dart';
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          PortfolioColors.linearBgStart,
          PortfolioColors.linearBgEnd
        ])),
        child: Center(
          child: SpinKitDoubleBounce(
            color: PortfolioColors.white,
          ),
        ),
      ),
    );
  }
}
