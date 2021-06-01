import 'dart:io';

import 'package:flutter/material.dart';

extension HoverExtensions on Widget {
  // Get a regerence to the body of the view
  Widget get moveUpOnHover {
    return isWeb()
        ? this
        : TranslateOnHover(
            child: this,
          );
  }
}

bool isWeb() {
  bool web = false;
  try {
    if (Platform.isAndroid || Platform.isIOS) {
      web = false;
    } else {
      web = true;
    }
  } catch (e) {
    web = true;
  }
  return web;
}

class TranslateOnHover extends StatefulWidget {
  final Widget? child;
  // You can also pass the translation in here if you want to
  TranslateOnHover({Key? key, this.child}) : super(key: key);

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -10, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: widget.child,
        transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}
