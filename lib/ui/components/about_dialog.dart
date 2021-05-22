import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

void showProjectDialog(BuildContext context, String? title, String? desc1,
    String? desc2, String htmlUrl) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: PortfolioColors.radialBgEnd,
          title: Center(
            child: Text(title!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: PortfolioColors.white,
                    fontSize: 32.sp)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "About",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                    color: PortfolioColors.wave1),
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                desc1!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: PortfolioColors.lightBlue, fontSize: 18.sp),
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                desc2!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: PortfolioColors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 32.h,
              ),
              TextButton(
                  onPressed: () => launch(htmlUrl),
                  child: Text(htmlUrl, style: TextStyle(fontSize: 16.sp)))
            ],
          )));
}
