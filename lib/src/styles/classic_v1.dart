import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:marj_card_styles/src/model/model.dart';
import 'package:marj_card_styles/src/util/util.dart';
import 'package:marj_card_styles/src/widget/action_card.dart';
import 'package:marj_card_styles/src/widget/widget.dart';

class ClassicCard extends StatelessWidget {
  const ClassicCard(this.card, {super.key});

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            AspectRatio(
              aspectRatio: coverPhotoSize.aspectRatio,
              child: KCachedImg(
                card.coverImg,
                padding: EdgeInsets.zero,
                width: double.maxFinite,
                showPreview: true,
                radius: 0,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 30,
              bottom: -50,
              child: Card(
                shape: const CircleBorder(),
                child: KCachedImg(
                  card.profilePhoto,
                  height: 100,
                  width: 100,
                  radius: 180,
                  showPreview: true,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 60),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    fixedSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => URLHelper.mail(card.email),
                  icon: const Icon(Icons.email_rounded),
                  label: const Text('Email Now'),
                ),
              ),
              const SizedBox(width: 10),
              FilledButton.icon(
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
        ),
        const Divider(height: 40),
        Padding(
          padding: defaultFullBodyPadding.copyWith(top: 0, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("About", style: context.textTheme.titleLarge),
              const SizedBox(height: 2),
              Text(
                card.about,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorTheme.onBackground.withOpacity(0.8),
                ),
              ),
              const Divider(height: 40),
              Text("Contact Me", style: context.textTheme.titleLarge),
              const SizedBox(height: 2),
              ListView(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                children: [
                  ActionCard(
                    label: Text(card.primaryPhone),
                    actionText: 'call',
                    actionIcon: Icons.call_rounded,
                    onActionTap: () => URLHelper.call(card.secondaryPhone!),
                    leading: const Icon(Icons.circle, size: 8),
                  ),
                  if (card.secondaryPhone != null)
                    ActionCard(
                      label: Text(card.secondaryPhone!),
                      actionText: 'call',
                      actionIcon: Icons.call_rounded,
                      onActionTap: () => URLHelper.call(card.secondaryPhone!),
                      leading: const Icon(Icons.circle, size: 8),
                    ),
                  ActionCard(
                    label: Text(card.email),
                    actionText: 'mail',
                    actionIcon: Icons.email_rounded,
                    onActionTap: () => URLHelper.mail(card.email),
                    leading: const Icon(Icons.circle, size: 8),
                  ),
                ],
              ),
              const Divider(height: 40),
              Text("Find Me", style: context.textTheme.titleLarge),
              const SizedBox(height: 2),
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
                            KCachedImg(
                              e.logo,
                              height: 30,
                              width: 30,
                              padding: const EdgeInsets.all(0),
                            ),
                            const SizedBox(width: 5),
                            Text(e.name),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(height: 40),
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
        ),
      ],
    );
  }
}
