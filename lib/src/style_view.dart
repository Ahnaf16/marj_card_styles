import 'package:flutter/material.dart';
import 'package:marj_card_styles/src/util/util.dart';
import 'package:marj_card_styles/src/widget/image.dart';

import 'model/model.dart';

class CardStyleSelection extends StatelessWidget {
  const CardStyleSelection({
    super.key,
    required this.currentStyle,
    required this.onSelection,
  });
  final CardStyle currentStyle;
  final Function(CardStyle style) onSelection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: context.adaptiveWidth(),
          ),
          Text(
            'Available Styles',
            style: context.textTheme.titleLarge,
          ),
          const Divider(
            height: 20,
            thickness: 2,
          ),
          Text.rich(
            const TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(Icons.help, size: 15),
                  alignment: PlaceholderAlignment.middle,
                ),
                TextSpan(text: '  tap and hold for preview'),
              ],
            ),
            style: context.textTheme.bodySmall,
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              ...CardStyle.values.map(
                (e) => InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onLongPress: () => showDialog(
                    context: context,
                    builder: (BuildContext ctx) =>
                        ImageDialog(url: e.previewImg, isAsset: true),
                  ),
                  onTap: () async {
                    context.pop;
                    await onSelection(e);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colorTheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: context.colorTheme.outline,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.asset(
                                e.previewImg,
                                height: 100,
                                width: 70,
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                            if (currentStyle == e)
                              const Positioned(
                                right: -5,
                                top: -5,
                                child: CircleAvatar(
                                  radius: 12,
                                  child: Icon(Icons.check_rounded, size: 15),
                                ),
                              ),
                          ],
                        ), //
                        const SizedBox(height: 2),
                        Text(e.name.toTitleCase),
                        const SizedBox(height: 5),
                      ],
                    ),
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
