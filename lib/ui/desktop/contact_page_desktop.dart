import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/buisness_logic/providers.dart';
import 'package:portfolio/generated/locale_base.dart';
import 'package:portfolio/ui/components/blue_waves.dart';
import 'package:portfolio/ui/components/stroke_button.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class ContactPageDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase)!;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Stack(
        children: [
          _UpperWave(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Title(
                loc: loc,
              ),
              Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    _LeftContact(
                      loc: loc,
                    ),
                    _RightContact(loc: loc)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    required this.loc,
  }) : super(key: key);

  final LocaleBase? loc;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(
        top: 160.h,
        left: 101.w,
      ),
      child: Text(
        loc!.contact.contact_me,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 56.sp,
            color: PortfolioColors.white),
      ),
    );
  }
}

class _RightContact extends HookWidget {
  final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: PortfolioColors.white));
  _RightContact({
    Key? key,
    required this.loc,
  }) : super(key: key);
  final LocaleBase loc;
  @override
  Widget build(BuildContext context) {
    final model = useProvider(mainViewModel);
    return Positioned(
      right: 0,
      child: Container(
        width: 605.w,
        decoration: BoxDecoration(
            color: PortfolioColors.formBg,
            borderRadius: BorderRadius.circular(32)),
        margin: EdgeInsets.only(right: 101.w, top: 92.h),
        padding: EdgeInsets.symmetric(horizontal: 48.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 38.h,
            ),
            Text(
              loc.contact.contact_form,
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: PortfolioColors.white),
            ),
            SizedBox(
              height: 32.h,
            ),
            SizedBox(
              height: 28.h,
              width: 284.w,
              child: TextField(
                controller: model.nameTEC,
                style: TextStyle(color: PortfolioColors.white, fontSize: 12.sp),
                maxLength: 32,
                decoration: InputDecoration(
                    labelText: loc.contact.your_name,
                    labelStyle: TextStyle(
                        fontSize: 12.sp, color: PortfolioColors.white),
                    border: inputBorder,
                    counterText: "",
                    focusedBorder: inputBorder,
                    enabledBorder: inputBorder),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 28.h,
              width: 284.w,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: model.emailTEC,
                style: TextStyle(color: PortfolioColors.white, fontSize: 12.sp),
                maxLength: 32,
                decoration: InputDecoration(
                    labelText: loc.contact.e_mail,
                    labelStyle: TextStyle(
                        fontSize: 12.sp, color: PortfolioColors.white),
                    border: inputBorder,
                    counterText: "",
                    focusedBorder: inputBorder,
                    enabledBorder: inputBorder),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Text(
              loc.contact.message,
              style: TextStyle(fontSize: 12.sp, color: PortfolioColors.white),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              height: 100.h,
              width: 511.w,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: PortfolioColors.formMessageBg,
                  borderRadius: BorderRadius.circular(16)),
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                controller: model.messageTEC,
                style: TextStyle(color: PortfolioColors.white, fontSize: 12.sp),
                maxLength: 4000,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    counterText: "",
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            StrokeButton(
              busy: model.busy,
              color: PortfolioColors.white,
              onPressed: () {
                model.sendMessage();
              },
              text: "Send",
              textSize: 12.sp,
            ),
            SizedBox(
              height: 60.h,
            ),
          ],
        ),
      ),
    );
  }
}

class _LeftContact extends StatelessWidget {
  const _LeftContact({
    Key? key,
    required this.loc,
  }) : super(key: key);
  final LocaleBase loc;
  @override
  Widget build(BuildContext context) {
    log("loc $loc");
    return Container(
        margin: EdgeInsets.only(left: 101.w, top: 92.h),
        width: 404.w,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: PortfolioColors.infoBg),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 48.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 38.h,
                      ),
                      Text(
                        loc.contact.contact_information,
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: PortfolioColors.white),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        loc.contact.contact_information_sub,
                        style: TextStyle(
                            fontSize: 14.sp, color: PortfolioColors.white),
                      ),
                      SizedBox(
                        height: 94.h,
                      ),
                      _ContactButtons(),
                      SizedBox(
                        height: 82.h,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class _ContactButtons extends HookWidget {
  const _ContactButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = useProvider(mainViewModel);
    return Column(
      children: [
        _ContactButton(
          image: AssetImage("assets/images/linkedin.png"),
          url: "https://www.linkedin.com/in/sstasik",
          onPress: model.goToLinkedIn,
        ),
        SizedBox(
          height: 38.h,
        ),
        _ContactButton(
          image: AssetImage("assets/images/email.png"),
          url: "szymon.stasik1@gmail.com",
          onPress: model.copyEmail,
        ),
        SizedBox(
          height: 38.h,
        ),
        _ContactButton(
          image: AssetImage("assets/images/github.png"),
          url: "https://github.com/DeNatur",
          onPress: model.goToGithub,
        ),
      ],
    );
  }
}

class _ContactButton extends StatelessWidget {
  const _ContactButton({
    Key? key,
    required this.image,
    required this.url,
    required this.onPress,
  }) : super(key: key);
  final ImageProvider image;
  final String url;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: onPress as void Function(),
        child: Row(
          children: [
            ImageIcon(
              image,
              size: 24.w,
              color: PortfolioColors.white,
            ),
            SizedBox(
              width: 9.w,
            ),
            Text(
              url,
              style:
                  TextStyle(color: PortfolioColors.lightBlue, fontSize: 14.sp),
            )
          ],
        ));
  }
}

class _UpperWave extends StatelessWidget {
  const _UpperWave({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationZ(math.pi),
      child: PlayAnimation(
        tween: Tween<Offset>(begin: Offset(0, 250.h), end: Offset(0, 100.h)),
        curve: Curves.easeInOutSine,
        builder: (context, child, Offset value) => Opacity(
            opacity: 1 - (value.dy / 250.h),
            child: Transform.translate(offset: value, child: child)),
        child: BlueWaves(),
      ),
    );
  }
}
