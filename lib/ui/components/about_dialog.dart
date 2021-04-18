import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:html' as html;

void showProjectDialog(BuildContext context, String title, String desc1,
    String desc2, String htmlUrl) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: PortfolioColors.radialBgEnd,
          title: Center(
            child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: PortfolioColors.white,
                    fontSize: 42.sp)),
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
                    fontSize: 36.sp,
                    color: PortfolioColors.wave1),
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                desc1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: PortfolioColors.lightBlue, fontSize: 18.sp),
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                desc2,
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
                  onPressed: () => html.window.open(htmlUrl, "project"),
                  child: Text(htmlUrl, style: TextStyle(fontSize: 16.sp)))
            ],
          )));
}
