import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/utils/widgets/screen_type_util.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.setAppropiateScreenType(context);
    return Scaffold(
      body: Container(
        color: Colors.red,
        width: 50.w,
        height: 50.h,
      ),
    );
  }
}
