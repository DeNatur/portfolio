import 'package:flutter/material.dart';
import 'package:portfolio/ui/components/icon_image_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:url_launcher/url_launcher.dart';

class IconContactRow extends StatelessWidget {
  final AlignmentGeometry alignment;
  const IconContactRow({
    Key? key,
    this.alignment = Alignment.topRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconImageButton(
            image: AssetImage("assets/images/github.png"),
            onPressed: () => launch("https://github.com/DeNatur"),
          ),
          SizedBox(
            width: 36.w,
          ),
          IconImageButton(
            image: AssetImage("assets/images/fb.png"),
            onPressed: () =>
                launch("https://www.facebook.com/szymon.stasik.10"),
          ),
          SizedBox(
            width: 36.w,
          ),
          IconImageButton(
            image: AssetImage("assets/images/linkedin.png"),
            onPressed: () => launch("https://www.linkedin.com/in/szymonstasik"),
          ),
        ],
      ),
    );
  }
}
