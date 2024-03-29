import 'package:flutter/widgets.dart';
import 'package:portfolio/generated/locale_base.dart';
import 'package:portfolio/ui/desktop/technical_skill.dart';
import 'package:portfolio/utils/statics/asset_names.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicalSkillsRow extends StatelessWidget {
  const TechnicalSkillsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase)!;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 101.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TechnicalSkill(
              image: AssetImage(ASSET_FIREBASE),
              title: loc.about.backend,
              desc: loc.about.backend_desc),
          TechnicalSkill(
              image: AssetImage(ASSET_FLUTTER),
              title: loc.about.flutter,
              desc: loc.about.flutter_desc),
          TechnicalSkill(
              image: AssetImage(ASSET_ANRDOID),
              title: loc.about.android,
              desc: loc.about.android_desc),
          TechnicalSkill(
              image: AssetImage(ASSET_FIGMA),
              title: loc.about.other,
              desc: loc.about.other_desc),
        ],
      ),
    );
  }
}
