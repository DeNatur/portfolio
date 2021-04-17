import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/buisness_logic/providers.dart';
import 'package:portfolio/buisness_logic/view_models/main_viewmodel.dart';
import 'package:portfolio/utils/statics/asset_names.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import 'package:portfolio/utils/statics/colors.dart';
import 'package:portfolio/utils/widgets/screen_type_util.dart';
import 'package:portfolio/utils/widgets/web_extensions.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationArrows extends HookWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.setAppropiateScreenType(context);
    MainViewModel model = useProvider<MainViewModel>(mainViewModel);
    PortfolioPage currentPage = model.currentPage;
    String leftText = "", rightText = "";
    double size, textSize;
    switch (currentPage) {
      case PortfolioPage.Home:
        leftText = "";
        rightText = "About";
        break;
      case PortfolioPage.About:
        leftText = "Home";
        rightText = "Experience";
        break;
      case PortfolioPage.Experience:
        leftText = "About";
        rightText = "Contact";
        break;
      case PortfolioPage.Contact:
        leftText = "Experience";
        rightText = "";
        break;
    }
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    switch (deviceType) {
      case DeviceScreenType.tablet:
        size = 100.h;
        textSize = 18.sp;
        break;
      case DeviceScreenType.mobile:
        size = 60.h;
        textSize = 12.sp;
        break;
      default:
        size = 100.h;
        textSize = 18.sp;
        break;
    }
    return Center(
      child: Row(
        children: [
          SizedBox(width: 20.w),
          leftText == ""
              ? Container()
              : ArrowAnim(
                  onPressed: model.previousPage,
                  size: size,
                  textSize: textSize,
                  text: leftText,
                  reverse: true,
                ),
          Spacer(),
          rightText == ""
              ? Container()
              : ArrowAnim(
                  onPressed: model.nextPage,
                  size: size,
                  textSize: textSize,
                  text: rightText,
                  reverse: false,
                ),
          SizedBox(width: 20.w),
        ],
      ),
    );
  }
}

class ArrowAnim extends StatefulWidget {
  final bool reverse;
  final String text;
  final double size;
  final double textSize;
  final Function onPressed;
  const ArrowAnim({
    Key key,
    @required this.size,
    @required this.textSize,
    this.reverse = false,
    @required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  _ArrowAnimState createState() => _ArrowAnimState();
}

class _ArrowAnimState extends State<ArrowAnim> with TickerProviderStateMixin {
  bool animate = false;
  AnimationController _arrowController;
  AnimationController _textController;
  Animation<double> _textAnimation;

  @override
  void reassemble() {
    ScreenSizeUtil.setAppropiateScreenType(context);
    super.reassemble();
  }

  @override
  void dispose() {
    _arrowController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _arrowController = AnimationController(vsync: this);
    _textController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    if (widget.reverse) {
      _textAnimation =
          Tween<double>(begin: 0, end: widget.size).animate(_textController)
            ..addListener(() {
              setState(() {});
            });
    } else {
      _textAnimation = Tween<double>(begin: 0, end: -1 * widget.size)
          .animate(_textController)
            ..addListener(() {
              setState(() {});
            });
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    double opacity = (_textAnimation.value / widget.size).abs();
    if (opacity < 0) opacity = 0;
    if (opacity > 1) opacity = 1;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: opacity,
              child: Transform.translate(
                  offset: Offset(_textAnimation.value, 0),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                        color: PortfolioColors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: widget.textSize),
                  )),
            ),
            widget.reverse
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: LottieBuilder.asset(
                      ASSET_ANIMATIONS_ARROW,
                      controller: _arrowController,
                      height: widget.size,
                      onLoaded: (composition) {
                        _arrowController..duration = composition.duration;
                      },
                    ),
                  )
                : LottieBuilder.asset(
                    ASSET_ANIMATIONS_ARROW,
                    controller: _arrowController,
                    height: widget.size,
                    onLoaded: (composition) {
                      _arrowController..duration = composition.duration;
                    },
                  ),
          ],
        ),
      ),
      onEnter: (_) {
        _arrowController.repeat();
        _textController.forward();
      },
      onExit: (_) {
        _arrowController.stop();
        _arrowController.reset();
        _textController.reverse();
      },
    );
  }
}
