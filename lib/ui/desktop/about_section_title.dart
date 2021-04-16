import 'package:flutter/cupertino.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutSectionTitleDesktop extends StatelessWidget {
  final String sectionTitle;
  final String section;

  const AboutSectionTitleDesktop(
      {Key key, @required this.sectionTitle, @required this.section})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            sectionTitle,
            style: TextStyle(
              color: PortfolioColors.ultraLightBlue,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 33.h,
          ),
          Text(
            section,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36.sp,
                color: PortfolioColors.white),
          ),
          SizedBox(
            height: 38.h,
          ),
          Container(
            width: 100.w,
            height: 4.h,
            decoration: BoxDecoration(
                color: PortfolioColors.ultraLightBlue,
                borderRadius: BorderRadius.circular(16)),
          )
        ],
      ),
    );
  }
}
