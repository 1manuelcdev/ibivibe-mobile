import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselDotIndicator extends StatelessWidget {
  final int activeIndex;
  final int itemsLength;

  const CarouselDotIndicator({
    super.key,
    required this.activeIndex,
    required this.itemsLength,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          decoration: BoxDecoration(
            color: context.theme.colors.background.withAlpha(200),
            borderRadius: BorderRadius.circular(20),
          ),
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: itemsLength,
            effect: ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: context.theme.colors.foreground,
              dotColor: context.theme.colors.mutedForeground,
              expansionFactor: 3.5,
              spacing: 6,
            ),
          ),
        ),
      ],
    );
  }
}
