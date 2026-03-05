import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:ibiapabaapp/shared/ui/fragments/effects/default_shimmer_effect.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EventsOverviewScreen extends StatefulWidget {
  const EventsOverviewScreen({super.key});

  @override
  State<EventsOverviewScreen> createState() => _EventsOverviewScreenState();
}

class _EventsOverviewScreenState extends State<EventsOverviewScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: customShimmerEffect(context),
      enabled: _isLoading,
      child: Column(
        children: [
          FHeader.nested(
            title: Skeleton.keep(
              child: Text('Eventos', style: context.theme.typography.base),
            ),
            prefixes: [
              FButton.icon(
                style: FButtonStyle.ghost(),
                onPress: () => context.pop(),
                child: Icon(Icons.arrow_back_rounded, size: 24),
              ),
            ],
            suffixes: [
              FButton.icon(
                style: FButtonStyle.ghost(),
                onPress: () {
                  showFToast(
                    context: context,
                    title: Text(
                      'TODO: Implementar redirect para expandedSearch',
                      style: context.theme.typography.sm,
                    ),
                  );
                },
                child: Icon(Icons.search, size: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
