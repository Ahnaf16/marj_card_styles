import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:marj_card_styles/src/model/model.dart';
import 'package:marj_card_styles/src/util/util.dart';
import 'package:marj_card_styles/src/widget/action_card.dart';
import 'package:marj_card_styles/src/widget/widget.dart';

class ClassicV2Card extends StatelessWidget {
  const ClassicV2Card(this.card, {super.key});

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultFullBodyPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: KCachedImg(card.profilePhoto).provider,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: const SizedBox(
                    height: 250,
                    width: 250,
                  ),
                ),
              ),
              Card(
                shape: const CircleBorder(),
                child: KCachedImg(
                  card.profilePhoto,
                  height: 200,
                  width: 200,
                  showPreview: true,
                  radius: 180,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            card.name,
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            card.bio,
            style: context.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("About", style: context.textTheme.titleLarge),
                  const SizedBox(height: 2, width: double.infinity),
                  Text(
                    card.about,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorTheme.onBackground.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Contact", style: context.textTheme.titleLarge),
                      TextButton.icon(
                        style: FilledButton.styleFrom(
                          fixedSize: const Size.fromHeight(40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          VCardManage.downloadCard(card);
                        },
                        icon: const Icon(Icons.save_alt_rounded),
                        label: const Text('Save'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  ActionCard(
                    label: Text(card.primaryPhone),
                    actionText: 'Call',
                    actionIcon: Icons.call_rounded,
                    onActionTap: () => URLHelper.call(card.primaryPhone),
                    margin: EdgeInsets.zero,
                  ),
                  if (card.secondaryPhone != null) const SizedBox(height: 10),
                  if (card.secondaryPhone != null)
                    ActionCard(
                      label: Text(card.secondaryPhone!),
                      actionText: 'Call',
                      actionIcon: Icons.call_rounded,
                      onActionTap: () => URLHelper.call(card.secondaryPhone!),
                      margin: EdgeInsets.zero,
                    ),
                  const SizedBox(height: 10),
                  ActionCard(
                    label: Text(card.email),
                    actionText: 'Mail',
                    actionIcon: Icons.email_rounded,
                    onActionTap: () => URLHelper.mail(card.email),
                    margin: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Social", style: context.textTheme.titleLarge),
                  const SizedBox(height: 2, width: double.maxFinite),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
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
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Website",
                    style: context.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 2),
                  ActionCard(
                    label: Text(card.website),
                    actionText: 'Visit',
                    actionIcon: Icons.language,
                    onActionTap: () => URLHelper.url(card.website),
                    margin: const EdgeInsets.all(0),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (card.gallery.isNotEmpty)
            Column(
              children: [
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
                  itemBuilder: (context, index) => Card(
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
        ],
      ),
    );
  }
}
