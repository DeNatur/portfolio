import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/utils/widgets/web_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconImageButton extends StatelessWidget {
  final Function onPressed;
  final ImageProvider image;
  final Color color;
  const IconImageButton(
      {Key key,
      @required this.onPressed,
      @required this.image,
      this.color = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24.w,
      icon: ImageIcon(
        image,
        color: color,
      ),
      onPressed: onPressed,
    ).showCursorOnHover.moveUpOnHover;
  }
}
