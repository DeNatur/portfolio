import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

import '../utils/statics/asset_names.dart';

class CacheService {
  BuildContext context;

  CacheService(this.context);

  Future preCacheImagesAndAnimations() async {
    await _precacheImages();
    await _precacheAnimations();
    log("end lottie");
  }

  Future _precacheAnimations() async {
    await _precacheLottieAnimation(ASSET_ANIMATIONS_MOBILE2);
    await _precacheLottieAnimation(ASSET_ANIMATIONS_ARROW);
  }

  Future _precacheLottieAnimation(String animationName) async {
    await AssetLottie(animationName).load();
  }

  Future _precacheImages() async {
    await precacheImage(AssetImage(ASSET_HOME), context);
    await precacheImage(AssetImage(ASSET_BACKGROUND), context);
    await precacheImage(AssetImage(ASSET_WAVE), context);
    await precacheImage(AssetImage(ASSET_UPPER_WAVE), context);
    await precacheImage(AssetImage(ASSET_EXPLORY), context);
    await precacheImage(AssetImage(ASSET_FIGMA), context);
    await precacheImage(AssetImage(ASSET_FIREBASE), context);
    await precacheImage(AssetImage(ASSET_AIDER), context);
    await precacheImage(AssetImage(ASSET_FLUTTER), context);
    await precacheImage(AssetImage(ASSET_GOOGLE), context);
    await precacheImage(AssetImage(ASSET_INTARG), context);
    await precacheImage(AssetImage(ASSET_ISEF), context);
    await precacheImage(AssetImage(ASSET_INTARG), context);
    await precacheImage(AssetImage(ASSET_ME), context);
    await precacheImage(AssetImage(ASSET_ANRDOID), context);
    await precacheImage(AssetImage(ASSET_AIDER_ART), context);
    await precacheImage(AssetImage(ASSET_BMI), context);
    await precacheImage(AssetImage(ASSET_CONTACT), context);
    await precacheImage(AssetImage(ASSET_FINDAIR), context);
    await precacheImage(AssetImage(ASSET_FINDAIR_RESEARCH), context);
    await precacheImage(AssetImage(ASSET_GOOGLE_MAPS), context);
    await precacheImage(AssetImage(ASSET_GOOGLE_PLAY), context);
    await precacheImage(AssetImage(ASSET_PORTFOLIO), context);
    await precacheImage(AssetImage(ASSET_WA_CALCULATOR), context);
    await precacheImage(AssetImage(ASSET_DRINGO), context);
  }
}
