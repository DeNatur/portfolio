import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/buisness_logic/providers.dart';
import 'package:portfolio/generated/locale_base.dart';
import 'package:portfolio/ui/components/blue_waves.dart';
import 'package:portfolio/ui/components/icon_image_button.dart';
import 'package:portfolio/ui/components/icon_row.dart';
import 'package:portfolio/ui/components/stroke_button.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class ContactPageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Contact information",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
              color: PortfolioColors.white),
        ),
        SizedBox(
          height: 16.sp,
        ),
        Text(
          "Contact me directly through\ninformations provided below",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.sp, color: PortfolioColors.white),
        ),
        SizedBox(
          height: 32.sp,
        ),
        ContactRow()
      ],
    );
  }
}

class ContactRow extends HookWidget {
  const ContactRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = useProvider(mainViewModel);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconContactRow(),
        SizedBox(
          width: 36.w,
        ),
        IconImageButton(
          image: AssetImage("assets/images/email.png"),
          onPressed: model.copyEmail,
        ),
      ],
    );
  }
}
