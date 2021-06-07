import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/buisness_logic/providers.dart';
import 'package:portfolio/buisness_logic/view_models/main_viewmodel.dart';
import 'package:portfolio/ui/components/icon_image_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:url_launcher/url_launcher.dart';

class IconContactRow extends HookWidget {
  final AlignmentGeometry alignment;
  const IconContactRow({
    Key? key,
    this.alignment = Alignment.topRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainViewModel model = useProvider(mainViewModel);
    return Align(
      alignment: alignment,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconImageButton(
            image: AssetImage("assets/images/github.png"),
            onPressed: model.goToGithub,
          ),
          SizedBox(
            width: 36.w,
          ),
          IconImageButton(
            image: AssetImage("assets/images/fb.png"),
            onPressed: model.goToFaceBook,
          ),
          SizedBox(
            width: 36.w,
          ),
          IconImageButton(
            image: AssetImage("assets/images/linkedin.png"),
            onPressed: model.goToLinkedIn,
          ),
        ],
      ),
    );
  }
}
