import 'package:flutter/cupertino.dart';
import 'package:portfolio/ui/desktop/about_section_title.dart';

class TimelineDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          AboutSectionTitleDesktop(sectionTitle: "About", section: "Timeline"),
    );
  }
}
