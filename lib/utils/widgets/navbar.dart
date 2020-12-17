import 'package:flutter/material.dart';
import 'package:portfolio/utils/statics/colors.dart';

class NavBar extends StatelessWidget {
  final int index;

  const NavBar({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(600.0, 100.0),
            painter: NavBarPainter(color_navbar),
          ),
          CustomPaint(
            size: Size(600.0, 100.0),
            painter: IndicatorPainter(color_ultra_light_blue, index),
          ),
          Container(
            width: 600,
            height: 100,
            alignment: Alignment.center,
            child: IconButton(
              icon: ImageIcon(
                AssetImage("assets/images/icon_left.png"),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

class IndicatorPainter extends CustomPainter {
  final Color color;
  final int index;
  IndicatorPainter(this.color, this.index);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;
    switch (index) {
      case 0:
        Path path_5 = Path();
        path_5.moveTo(size.width * 0.15, size.height * 0.50);
        path_5.quadraticBezierTo(size.width * 0.10, size.height * 0.63,
            size.width * 0.08, size.height * 0.69);
        path_5.quadraticBezierTo(size.width * 0.06, size.height * 0.75,
            size.width * 0.00, size.height * 0.99);

        canvas.drawPath(path_5, paint);
        break;
      case 1:
        Path path_4 = Path();
        path_4.moveTo(size.width * 0.33, size.height * 0.11);
        path_4.quadraticBezierTo(size.width * 0.27, size.height * 0.20,
            size.width * 0.25, size.height * 0.25);
        path_4.quadraticBezierTo(size.width * 0.22, size.height * 0.30,
            size.width * 0.15, size.height * 0.50);

        canvas.drawPath(path_4, paint);
        break;
      case 3:
        Path path_2 = Path();
        path_2.moveTo(size.width * 0.67, size.height * 0.10);
        path_2.quadraticBezierTo(size.width * 0.74, size.height * 0.22,
            size.width * 0.77, size.height * 0.29);
        path_2.quadraticBezierTo(size.width * 0.79, size.height * 0.33,
            size.width * 0.85, size.height * 0.50);
        canvas.drawPath(path_2, paint);
        break;
      case 4:
        Path path_3 = Path();
        path_3.moveTo(size.width * 0.85, size.height * 0.50);
        path_3.quadraticBezierTo(size.width * 0.91, size.height * 0.67,
            size.width * 0.92, size.height * 0.73);
        path_3.quadraticBezierTo(size.width * 0.95, size.height * 0.82,
            size.width * 1.00, size.height);

        canvas.drawPath(path_3, paint);
        break;
      default:
        Path path_1 = Path();
        path_1.moveTo(size.width * 0.33, size.height * 0.10);
        path_1.quadraticBezierTo(
            size.width * 0.42, size.height * 0.01, size.width * 0.50, 0);
        path_1.quadraticBezierTo(size.width * 0.58, size.height * 0.01,
            size.width * 0.67, size.height * 0.10);

        canvas.drawPath(path_1, paint);
        break;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class NavBarPainter extends CustomPainter {
  final Color color;

  NavBarPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.quadraticBezierTo(
        size.width * 0.25, size.height * 0.00, size.width * 0.50, 0);
    path_0.quadraticBezierTo(
        size.width * 0.75, size.height * -0.01, size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
