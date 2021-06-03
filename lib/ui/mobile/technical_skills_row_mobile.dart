import 'package:flutter/widgets.dart';
import 'package:portfolio/generated/locale_base.dart';
import 'package:portfolio/ui/desktop/technical_skill.dart';
import 'package:portfolio/utils/statics/asset_names.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicalSkillsMobileRow extends StatelessWidget {
  const TechnicalSkillsMobileRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase)!;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TechnicalSkillMobile(
                  image: AssetImage(ASSET_FIREBASE),
                  title: loc.about.backend,
                  desc: loc.about.backend_desc),
              TechnicalSkillMobile(
                  image: AssetImage(ASSET_FLUTTER),
                  title: loc.about.flutter,
                  desc: loc.about.flutter_desc),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TechnicalSkillMobile(
                  image: AssetImage(ASSET_ANRDOID),
                  title: loc.about.android,
                  desc: loc.about.android_desc),
              TechnicalSkillMobile(
                  image: AssetImage(ASSET_FIGMA),
                  title: loc.about.other,
                  desc: loc.about.other_desc),
            ],
          ),
        ],
      ),
    );
  }
}
