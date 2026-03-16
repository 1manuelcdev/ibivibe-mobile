import 'package:flutter/material.dart';
import 'package:ibiapabaapp/shared/ui/fragments/effects/default_shimmer_effect.dart';
import 'package:skeletonizer/skeletonizer.dart';

typedef CarouselItemBuilder<T> = Widget Function(BuildContext context, T item);

class HorizontalInfiniteCarousel<T> extends StatelessWidget {
  final List<T> items;
  final CarouselItemBuilder<T> itemBuilder;
  final double? itemWidth;
  final double listHeight;
  final Widget separator;
  final bool isLoading;

  const HorizontalInfiniteCarousel({
    super.key,
    required this.isLoading,
    required this.items,
    required this.listHeight,
    required this.separator,
    this.itemWidth,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: customShimmerEffect(context),
      enabled: isLoading,
      child: SizedBox(
        height: listHeight,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          clipBehavior: Clip.none,
          itemCount: items.length,
          separatorBuilder: (_, _) => separator,
          itemBuilder: (context, index) {
            final child = itemBuilder(context, items[index]);
            if (itemWidth == null) return child;
            return SizedBox(width: itemWidth, child: child);
          },
        ),
      ),
    );
  }
}
