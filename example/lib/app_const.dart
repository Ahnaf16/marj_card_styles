import 'package:flutter/material.dart';
import 'package:marj_card_styles/marj_card_styles.dart';

final defaultCard = CardModel(
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
  cardBackImg:
      'https://wallpapers.com/images/hd/abstract-background-6m6cjbifu3zpfv84.jpg',
  cardFrontImg:
      'https://img.freepik.com/premium-photo/abstract-background-images-wallpaper-ai-generated_643360-2395.jpg?size=626&ext=jpg&ga=GA1.1.1826414947.1699488000&semt=ais',
  themeMode: ThemeMode.light,
);
