import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:portfolio/utils/widgets/web_extensions.dart';

class CardPorftolioDesktop extends StatelessWidget {
  final Color color1;
  final Color color2;
  final ImageProvider? image;
  final String? title;
  final Function onPress;
  const CardPorftolioDesktop({
    Key? key,
    required this.color1,
    required this.color2,
    this.image,
    this.title,
    required this.onPress,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPress as void Function()?,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 12.h,
                  width: 96.h,
                  color: color1,
                ),
                Container(
                  height: 12.h,
                  width: 96.h,
                  color: color2,
                ),
              ],
            ),
            Container(
              width: 210.h,
              height: 280.h,
              color: PortfolioColors.technicalSkill,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  Image(
                    image: image!,
                    height: 139.h,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    title!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.sp,
                        color: PortfolioColors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ).moveUpOnHover;
  }
}

class CardDesktop extends StatelessWidget {
  final Color color1;
  final Color color2;
  final ImageProvider? image;
  final String? title;
  final String? desc;
  final Function onPress;
  const CardDesktop(
      {Key? key,
      required this.color1,
      required this.color2,
      this.image,
      this.title,
      this.desc,
      required this.onPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPress as void Function()?,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 12.h,
                  width: 96.h,
                  color: color1,
                ),
                Container(
                  height: 12.h,
                  width: 96.h,
                  color: color2,
                ),
              ],
            ),
            Container(
              width: 210.h,
              height: 280.h,
              color: PortfolioColors.technicalSkill,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 36.h,
                  ),
                  Image(
                    image: image!,
                    height: 92.h,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.sp,
                        color: PortfolioColors.white),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    desc!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.sp, color: PortfolioColors.lightBlue),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ).moveUpOnHover;
  }
}
