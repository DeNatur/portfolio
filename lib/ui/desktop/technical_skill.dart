import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/utils/statics/colors.dart';

class TechnicalSkillMobile extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String desc;
  const TechnicalSkillMobile(
      {Key key,
      @required this.image,
      @required this.title,
      @required this.desc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 42.w,
            width: 42.w,
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.w),
            child: Image(
              alignment: Alignment.center,
              image: image,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: PortfolioColors.technicalSkill),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            title,
            style: TextStyle(
                color: PortfolioColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: PortfolioColors.technicalSkillDesc,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}

class TechnicalSkill extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String desc;
  const TechnicalSkill(
      {Key key,
      @required this.image,
      @required this.title,
      @required this.desc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 133.w,
            width: 133.w,
            alignment: Alignment.center,
            padding: EdgeInsets.all(25.w),
            child: Image(
              alignment: Alignment.center,
              image: image,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: PortfolioColors.technicalSkill),
          ),
          SizedBox(
            height: 17.h,
          ),
          Text(
            title,
            style: TextStyle(
                color: PortfolioColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.sp),
          ),
          SizedBox(
            height: 19.h,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: PortfolioColors.technicalSkillDesc,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
