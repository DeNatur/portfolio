import 'package:flutter/material.dart';
import 'package:portfolio/ui/components/icon_image_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:html' as html;

class IconContactRow extends StatelessWidget {
  final AlignmentGeometry alignment;
  const IconContactRow({
    Key key,
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
            onPressed: () =>
                html.window.open("https://github.com/DeNatur", "github"),
          ),
          SizedBox(
            width: 36.w,
          ),
          IconImageButton(
            image: AssetImage("assets/images/fb.png"),
            onPressed: () => html.window
                .open("https://www.facebook.com/szymon.stasik.10", "facebook"),
          ),
          SizedBox(
            width: 36.w,
          ),
          IconImageButton(
            image: AssetImage("assets/images/linkedin.png"),
            onPressed: () => html.window
                .open("https://www.linkedin.com/in/szymonstasik", "linkedIn"),
          ),
          SizedBox(
            width: 36.w,
          ),
          IconImageButton(
            image: AssetImage("assets/images/email.png"),
            onPressed: () => html.window
                .open("https://www.linkedin.com/in/szymonstasik", "linkedIn"),
          ),
        ],
      ),
    );
  }
}
