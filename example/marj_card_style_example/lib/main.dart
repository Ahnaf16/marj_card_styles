import 'package:flutter/material.dart';
import 'package:marj_card_styles/marj_card_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Palette.defTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CardModel card = CardModel(
    userId: 'userId',
    cardId: 'cardId',
    name: 'TESTING',
    email: 'testing@test.com',
    coverImg:
        'https://firebasestorage.googleapis.com/v0/b/marj-card.appspot.com/o/users%2FKMMHZWCWpIN67t6ZzdgIcSX5URu2%2Fcover%2Fcover_Mtnei193Uq0cZNXYhCX6U.jpeg?alt=media&token=dff6d3fc-3fdb-4629-8cb4-7bbbcc90958a',
    primaryPhone: '01111111111',
    secondaryPhone: '01222555666',
    profilePhoto:
        'https://firebasestorage.googleapis.com/v0/b/marj-card.appspot.com/o/users%2FKMMHZWCWpIN67t6ZzdgIcSX5URu2%2Fprofile%2Fprofile_Mtnei193Uq0cZNXYhCX6U.jpeg?alt=media&token=bc028d40-3d9e-4365-90b4-7f5abb3f15e2',
    gallery: [
      'https://firebasestorage.googleapis.com/v0/b/marj-card.appspot.com/o/users%2FKMMHZWCWpIN67t6ZzdgIcSX5URu2%2Fgallery%2Fgallery_Mtnei193Uq0cZNXYhCX6U_%7B1%7D.jpeg?alt=media&token=e9ba9b40-0b5b-46a0-a424-174182a0bffc',
      'https://firebasestorage.googleapis.com/v0/b/marj-card.appspot.com/o/users%2FKMMHZWCWpIN67t6ZzdgIcSX5URu2%2Fgallery%2Fgallery_Mtnei193Uq0cZNXYhCX6U_%7B0%7D.jpeg?alt=media&token=a3bcc731-9391-45a9-9c9b-03253c3e419f'
    ],
    socials: [
      const SocialLink(
        name: 'name',
        url: 'url',
        logo:
            'https://firebasestorage.googleapis.com/v0/b/marj-card.appspot.com/o/social_icons%2Ffacebook.png?alt=media&token=e231b94b-9c89-4d22-9e4c-49f9572446e1',
      )
    ],
    website: 'https://website.com',
    about: 'about me',
    bio: 'my bio',
    createDate: DateTime.now(),
    style: CardStyle.classic,
  );

  changeStyle() {
    const styles = CardStyle.values;
    final current = styles.indexOf(card.style);
    int index = current + 1;
    if (index == styles.length) index = 0;
    setState(() => card = card.copyWith(style: styles[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          border: Border.symmetric(
            vertical: BorderSide(),
          ),
        ),
        width: 800,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('STYLES'),
            actions: [
              Text(card.style.name),
              const SizedBox(width: 10),
              FilledButton(
                onPressed: () {
                  changeStyle();
                },
                child: const Text('Change style'),
              ),
              const SizedBox(width: 10),
            ],
          ),
          body: SingleChildScrollView(
            child: card.style.styled(card),
          ),
        ),
      ),
    );
  }
}
