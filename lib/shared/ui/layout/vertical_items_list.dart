import 'package:flutter/material.dart';
import 'package:ibiapabaapp/shared/ui/fragments/effects/default_shimmer_effect.dart';
import 'package:skeletonizer/skeletonizer.dart';

typedef ListItemBuilder<T> = Widget Function(BuildContext context, T item);

class VerticalItemsList<T> extends StatelessWidget {
  final List<T> items;
  final ListItemBuilder<T> itemBuilder;
  final Widget separator;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;

  const VerticalItemsList({
    super.key,
    required this.isLoading,
    required this.items,
    required this.separator,
    required this.itemBuilder,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: customShimmerEffect(context),
      enabled: isLoading,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: padding ?? EdgeInsets.zero,
        itemCount: isLoading ? 5 : items.length,
        separatorBuilder: (_, _) => separator,
        itemBuilder: (context, index) {
          if (isLoading) {
            return itemBuilder(
              context,
              items.isNotEmpty ? items[0] : _getDummyData(),
            );
          }
          return itemBuilder(context, items[index]);
        },
      ),
    );
  }

  dynamic _getDummyData() => null;
}
