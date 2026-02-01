import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class NowHappeningSection extends StatelessWidget {
  const NowHappeningSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .start,
        spacing: 16,
        children: [
          Text(
            "Acontecendo agora em Ubajara",
            style: TextStyle(fontSize: 18, fontWeight: .w600),
          ),
          Column(
            spacing: 16,
            children: [
              ...List<SizedBox>.generate(
                6,
                (index) => SizedBox(
                  width: .infinity,
                  child: FCard(
                    title: Text(
                      "Evento $index",
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text("Lorem ipsum dolor sit amet"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
