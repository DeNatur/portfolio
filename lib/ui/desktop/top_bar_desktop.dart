import 'package:flutter/widgets.dart';
import 'package:portfolio/ui/components/top_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/utils/widgets/centered_view.dart';

class TopBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CenteredView(
          child: Container(
        alignment: Alignment.topRight,
        child: TopRow(),
      ),
    );
  }
}
