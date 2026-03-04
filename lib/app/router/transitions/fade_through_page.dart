import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

class FadeThroughPage<T> extends CustomTransitionPage<T> {
  FadeThroughPage({
    required super.child,
    required LocalKey super.key,
    Duration duration = const Duration(milliseconds: 350),
    Color? fillColor,
  }) : super(
         transitionDuration: duration,
         reverseTransitionDuration: duration,
         opaque: true,
         barrierDismissible: false,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return FadeThroughTransition(
             animation: animation,
             secondaryAnimation: secondaryAnimation,
             fillColor: fillColor ?? context.theme.colors.background,
             child: child,
           );
         },
       );
}
