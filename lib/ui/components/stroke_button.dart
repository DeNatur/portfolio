import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/utils/statics/colors.dart';

class StrokeButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final EdgeInsetsGeometry margin;

  const StrokeButton(
      {Key key,
      @required this.onPressed,
      @required this.text,
      this.color = color_ultra_light_blue,
      this.margin = EdgeInsets.zero})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(border: Border.all(width: 3, color: color)),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color_ultra_light_blue),
          ),
        ),
        onPressed: () => onPressed,
      ),
    );
  }
}
