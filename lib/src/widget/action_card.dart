import 'package:flutter/material.dart';
import 'package:marj_card_styles/src/util/util.dart';

class ActionCard extends StatelessWidget {
  const ActionCard({
    super.key,
    required this.label,
    this.labelStyle,
    required this.actionText,
    required this.actionIcon,
    this.onActionTap,
    this.margin,
    this.leading,
  });

  final Widget label;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? margin;
  final String actionText;
  final IconData actionIcon;
  final Widget? leading;
  final Function()? onActionTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: Duration.zero,
      style: labelStyle ?? context.textTheme.titleMedium!,
      child: Padding(
        padding:
            margin ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            if (leading != null) leading!,
            if (leading != null) const SizedBox(width: 10),
            label,
            const Spacer(),
            FilledButton.icon(
              onPressed: onActionTap,
              icon: Icon(actionIcon, size: 18),
              label: Text(actionText),
            ),
          ],
        ),
      ),
    );
  }
}
