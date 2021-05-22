import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

enum AnimProps { offset, rotation }

class MovingBackground extends StatelessWidget {
  final int maxRows;
  final int maxColumns;
  final bool animate;

  const MovingBackground(
      {Key? key, this.maxRows = 4, this.maxColumns = 10, this.animate = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: getRandomizedColumn(width),
    );
  }

  List<Widget> getRandomizedRow(double width) {
    Random random = new Random();
    int randomColumn = random.nextInt(maxRows);

    List<Widget> result = [];
    for (int i = 0; i < randomColumn; i++) {
      int randTime = random.nextInt(4000) + 7000;
      int randSize = random.nextInt(8) + 12;
      int randIcon = random.nextInt(3);
      double randRotate = random.nextDouble() + random.nextInt(2);
      double randMaxRotation = random.nextDouble() + random.nextInt(4);
      var _tween = MultiTween<AnimProps>()
        ..add(
            AnimProps.offset,
            Tween<double>(begin: -1 * (width / 2), end: width),
            Duration(milliseconds: randTime))
        ..add(
            AnimProps.rotation,
            Tween<double>(begin: randRotate, end: randRotate + randMaxRotation),
            Duration(milliseconds: randTime));

      if (animate) {
        result.add(LoopAnimation<MultiTweenValues<AnimProps>>(
          tween: _tween,
          duration: Duration(milliseconds: randTime),
          curve: Curves.linear,
          builder: (context, child, value) {
            return Transform.rotate(
              angle: value.get(AnimProps.rotation),
              child: Transform.translate(
                offset: Offset(value.get(AnimProps.offset), 0),
                child: child,
              ),
            );
          },
          child: Icon(
            randIcon == 0
                ? Icons.clear
                : randIcon == 1
                    ? Icons.add
                    : randIcon == 2
                        ? Icons.radio_button_unchecked
                        : Icons.check_box_outline_blank,
            color: Colors.white.withOpacity(0.3),
            size: randSize.toDouble(),
          ),
        ));
      } else {
        result.add(Icon(
          randIcon == 0
              ? Icons.clear
              : randIcon == 1
                  ? Icons.add
                  : randIcon == 2
                      ? Icons.radio_button_unchecked
                      : Icons.check_box_outline_blank,
          color: Colors.white.withOpacity(0.3),
          size: randSize.toDouble(),
        ));
      }
    }
    return result;
  }

  List<Widget> getRandomizedColumn(double width) {
    Random random = new Random();
    int randomColumn = random.nextInt(maxColumns) + 10;
    List<Widget> result = [];
    for (int i = 0; i < randomColumn; i++) {
      result.add(Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: getRandomizedRow(width)));
    }
    return result;
  }
}
