import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:story_view/story_view.dart';

class SponsoredHighlights extends StatefulWidget {
  const SponsoredHighlights({super.key});

  @override
  State<SponsoredHighlights> createState() => _SponsoredHighlightsState();
}

class _SponsoredHighlightsState extends State<SponsoredHighlights> {
  final StoryController _controller = StoryController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: ClipRRect(
        borderRadius: .circular(16),
        child: Stack(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onLongPressStart: (_) => _controller.pause(),
              onLongPressEnd: (_) => _controller.play(),
              child: MouseRegion(
                onEnter: (_) => _controller.pause(),
                onExit: (_) => _controller.play(),
                child: StoryView(
                  controller: _controller,
                  repeat: true,
                  inline: true,
                  indicatorForegroundColor:
                      context.theme.colors.mutedForeground,
                  indicatorColor: Colors.black26,
                  progressPosition: ProgressPosition.bottom,
                  indicatorOuterPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  storyItems: [
                    _bannerItem("Destaques patrocinados", context),
                    _bannerItem("Promoções imperdíveis", context),
                    _bannerItem("Ofertas próximas de você", context),
                  ],
                ),
              ),
            ),

            Positioned(top: 12, left: 12, child: _SponsoredLabel()),
          ],
        ),
      ),
    );
  }

  StoryItem _bannerItem(String text, BuildContext context) {
    return StoryItem(
      Container(
        color: context.theme.colors.muted,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: context.theme.colors.foreground,
          ),
        ),
      ),
      duration: const Duration(seconds: 4),
    );
  }
}

class _SponsoredLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: context.theme.colors.primary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Icon(
            Icons.campaign,
            size: 14,
            color: context.theme.colors.primaryForeground,
          ),
        ],
      ),
    );
  }
}
