import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:portfolio/utils/statics/colors.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        PortfolioColors.linearBgStart,
        PortfolioColors.linearBgEnd
      ])),
      child: Center(
        child: SpinKitDoubleBounce(
          color: PortfolioColors.white,
        ),
      ),
    );
  }
}
