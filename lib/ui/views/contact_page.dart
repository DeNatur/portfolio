import 'package:flutter/cupertino.dart';
import 'package:portfolio/ui/desktop/contact_page_desktop.dart';
import 'package:portfolio/ui/mobile/contact_page_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ContactPageMobile(),
      tablet: ContactPageMobile(),
      desktop: ContactPageDesktop(),
    );
  }
}
