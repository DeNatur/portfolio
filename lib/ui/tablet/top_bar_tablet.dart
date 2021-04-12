import 'package:flutter/widgets.dart';
import 'package:portfolio/ui/components/top_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopBaTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 56.h,
      ),
      alignment: Alignment.topCenter,
      child: TopRow(),
    );
  }
}
