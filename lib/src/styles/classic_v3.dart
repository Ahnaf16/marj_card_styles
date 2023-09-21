import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:marj_card_styles/src/model/model.dart';
import 'package:marj_card_styles/src/theme/default_theme.dart';
import 'package:marj_card_styles/src/util/util.dart';
import 'package:marj_card_styles/src/widget/action_card.dart';
import 'package:marj_card_styles/src/widget/widget.dart';

class ClassicV3Card extends StatelessWidget {
  const ClassicV3Card(this.card, {super.key});

  final CardModel card;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Palette.defTheme,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const SizedBox(height: 350),
              AspectRatio(
                aspectRatio: coverPhotoSize.aspectRatio,
                child: KCachedImg(
                  card.coverImg,
                  radius: 0,
                  showPreview: true,
                  fit: BoxFit.cover,
                  padding: EdgeInsets.zero,
                ),
              ),
              Positioned(
                top: 50,
                left: 1,
                right: 1,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 700,
                        minWidth: context.isSmall ? context.width : 660,
                      ),
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: context.colorTheme.background,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [Palette.defaultBoxShadow],
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const SizedBox(height: 70),
                          Text(
                            card.name,
                            style: context.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            card.bio,
                            style: context.textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          FilledButton(
                            style: FilledButton.styleFrom(
                              fixedSize: const Size(300, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Contacts'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(width: 500),
                                      ActionCard(
                                        label: Text(card.primaryPhone),
                                        actionText: 'Call',
                                        actionIcon: Icons.call_rounded,
                                        onActionTap: () =>
                                            URLHelper.call(card.primaryPhone),
                                        margin: EdgeInsets.zero,
                                        leading: const Icon(Icons.call_rounded),
                                      ),
                                      if (card.secondaryPhone != null)
                                        const Divider(height: 30),
                                      if (card.secondaryPhone != null)
                                        ActionCard(
                                          label: Text(card.secondaryPhone!),
                                          actionText: 'Call',
                                          actionIcon: Icons.call_rounded,
                                          onActionTap: () => URLHelper.call(
                                              card.secondaryPhone!),
                                          margin: EdgeInsets.zero,
                                          leading:
                                              const Icon(Icons.call_rounded),
                                        ),
                                      const Divider(height: 30),
                                      ActionCard(
                                        label: Text(card.email),
                                        actionText: 'Mail',
                                        actionIcon: Icons.email_rounded,
                                        onActionTap: () =>
                                            URLHelper.mail(card.email),
                                        margin: EdgeInsets.zero,
                                        leading:
                                            const Icon(Icons.email_rounded),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: const Text('Contacts'),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FilledButton.icon(
                                style: FilledButton.styleFrom(
                                  fixedSize: const Size(100, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () =>
                                    URLHelper.call(card.primaryPhone),
                                icon: const Icon(Icons.call_rounded),
                                label: const Text('Call'),
                              ),
                              const SizedBox(width: 10),
                              FilledButton.icon(
                                style: FilledButton.styleFrom(
                                  fixedSize: const Size(100, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () => URLHelper.mail(card.email),
                                icon: const Icon(Icons.email_rounded),
                                label: const Text('Mail'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -25,
                      left: 1,
                      right: 1,
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage:
                              KCachedImg(card.profilePhoto).provider,
                          radius: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ShowcaseCard(
                  header: 'About',
                  children: [
                    Text(
                      card.about,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.colorTheme.onBackground.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ShowcaseCard.wrap(
                  header: 'Social',
                  children: [
                    ...card.socials.map(
                      (e) => InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () => URLHelper.url(e.url),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              KCachedImg(e.logo, height: 30, width: 30),
                              const SizedBox(width: 5),
                              Text(e.name),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ShowcaseCard(
                  header: 'Website',
                  children: [
                    ActionCard(
                      label: Text(card.website),
                      actionText: 'Visit',
                      actionIcon: Icons.language,
                      onActionTap: () => URLHelper.url(card.website),
                      margin: const EdgeInsets.all(0),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Gallery",
                  style: context.textTheme.titleLarge,
                ),
                const SizedBox(height: 2),
                MasonryGridView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: card.gallery.length,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      color: context.colorTheme.background,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [Palette.defaultBoxShadow],
                    ),
                    margin: const EdgeInsets.all(10),
                    child: KCachedImg(
                      card.gallery[index],
                      fit: BoxFit.cover,
                      padding: const EdgeInsets.all(0),
                      showPreview: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShowcaseCard extends StatelessWidget {
  const ShowcaseCard({
    super.key,
    required this.header,
    required this.children,
  })  : _wrapped = false,
        spacing = 0;

  const ShowcaseCard.wrap({
    super.key,
    required this.header,
    required this.children,
    double space = 5,
  })  : _wrapped = true,
        spacing = space;

  final String header;
  final List<Widget> children;
  final bool _wrapped;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: context.colorTheme.background,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [Palette.defaultBoxShadow],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(header, style: context.textTheme.titleLarge),
            const SizedBox(height: 2),
            if (_wrapped)
              Wrap(
                runSpacing: spacing,
                spacing: spacing,
                children: [...children],
              )
            else
              ...children
          ],
        ),
      ),
    );
  }
}
