import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/ui/views/top_bar.dart';
import 'package:portfolio/utils/widgets/screen_type_util.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.setAppropiateScreenType(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
          ),
          TopBar(),
        ],
      ),
    );
  }
}
