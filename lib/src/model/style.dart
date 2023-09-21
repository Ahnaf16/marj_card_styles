import 'package:flutter/material.dart';
import 'package:marj_card_styles/src/model/model.dart';
import 'package:marj_card_styles/src/util/util.dart';

import '../styles/styles.dart';

enum CardStyle {
  classic,
  classicV2,
  classicV3;

  Widget styled(CardModel card, {ThemeData? theme}) => switch (this) {
        classic => ClassicCard(card, theme),
        classicV2 => ClassicV2Card(card, theme),
        classicV3 => ClassicV3Card(card, theme),
      };

  String get previewImg => switch (this) {
        classic => StyleImg.stylesClassic,
        classicV2 => StyleImg.stylesClassicV2,
        classicV3 => StyleImg.stylesClassicV3,
      };
}
