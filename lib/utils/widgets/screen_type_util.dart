import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScreenSizeUtil {
  /// Sets appropiate screen config for different types of design layouts.
  ///
  /// There are 3 sizes for 3 designs:
  ///  - mobile,
  ///  - desktop,
  ///  - tablet
  static void setAppropiateScreenType(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width;
    final double maxHeight = MediaQuery.of(context).size.height;
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    switch (deviceType) {
      case DeviceScreenType.tablet:
        _setDesignSize(maxWidth, maxHeight, 834, 1194);
        break;
      case DeviceScreenType.mobile:
        _setDesignSize(maxWidth, maxHeight, 360, 640);
        break;
      default:
        _setDesignSize(maxWidth, maxHeight, 1440, 905);
        break;
    }
  }

  static void _setDesignSize(
      double maxWidth, double maxHeight, double width, double height) {
    ScreenUtil.init(
        BoxConstraints(
          maxWidth: maxWidth,
          maxHeight: maxHeight,
        ),
        designSize: Size(width, height),
        orientation: Orientation.portrait);
  }
}
