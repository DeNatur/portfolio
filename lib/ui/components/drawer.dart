import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/buisness_logic/providers.dart';
import 'package:portfolio/buisness_logic/view_models/main_viewmodel.dart';
import 'package:portfolio/generated/locale_base.dart';
import 'package:portfolio/utils/statics/colors.dart';

class MainPageDrawer extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final double paddingTop = MediaQuery.of(context).padding.top;
    MainViewModel model = useProvider<MainViewModel>(mainViewModel);
    PortfolioPage currentPage = model.currentPage;
    final loc = Localizations.of<LocaleBase>(context, LocaleBase)!;

    return Container(
      width: ScreenUtil().screenWidth * 0.6,
      child: Stack(
        children: [
          _Background(),
          Padding(
            padding: EdgeInsets.only(top: paddingTop + 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "SZYMON STASIK",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: PortfolioColors.white),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: PortfolioColors.radialBgEnd,
                ),
                SizedBox(
                  height: 32.h,
                ),
                _DrawerTile(
                  onPressed: () => model.changePage(PortfolioPage.Home),
                  text: loc.main!.home,
                  currentPage: currentPage == PortfolioPage.Home,
                ),
                SizedBox(
                  height: 16.h,
                ),
                _DrawerTile(
                  onPressed: () => model.changePage(PortfolioPage.About),
                  text: loc.main!.about,
                  currentPage: currentPage == PortfolioPage.About,
                ),
                SizedBox(
                  height: 16.h,
                ),
                _DrawerTile(
                  onPressed: () => model.changePage(PortfolioPage.Experience),
                  text: loc.main!.experience,
                  currentPage: currentPage == PortfolioPage.Experience,
                ),
                SizedBox(
                  height: 16.h,
                ),
                _DrawerTile(
                  onPressed: () => model.changePage(PortfolioPage.Contact),
                  text: loc.main!.contact,
                  currentPage: currentPage == PortfolioPage.Contact,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  final Function onPressed;
  final String? text;
  final bool currentPage;
  const _DrawerTile({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.sp,
      alignment: Alignment.centerLeft,
      width: double.infinity,
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () {
          onPressed();
          Navigator.pop(context);
        },
        child: Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Text(text!,
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: PortfolioColors.white)),
              SizedBox(
                width: 4.w,
              ),
              currentPage
                  ? Container(
                      padding: EdgeInsets.only(top: 4.sp),
                      width: 8.sp,
                      height: 8.sp,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: PortfolioColors.ultraLightBlue),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
        child: Container(
          width: ScreenUtil().screenWidth * 0.6,
          color: Colors.black.withOpacity(0.2),
        ),
      ),
    );
  }
}
