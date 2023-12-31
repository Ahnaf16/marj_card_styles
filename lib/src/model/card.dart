import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marj_card_styles/src/model/model.dart';

class CardModel {
  const CardModel({
    this.docId = '',
    required this.userId,
    required this.cardId,
    required this.name,
    required this.email,
    required this.coverImg,
    required this.primaryPhone,
    required this.secondaryPhone,
    required this.profilePhoto,
    required this.gallery,
    required this.socials,
    required this.website,
    required this.about,
    required this.bio,
    required this.createDate,
    required this.style,
    required this.cardFrontImg,
    required this.cardBackImg,
    required this.themeMode,
  });

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      docId: map['docId'],
      cardId: map['cardId'],
      userId: map['userId'],
      about: map['about'] ?? '',
      bio: map['bio'] ?? '',
      coverImg: map['coverImg'] ?? '',
      email: map['email'] ?? '',
      gallery: List<String>.from(map['gallery']),
      name: map['name'] ?? '',
      primaryPhone: map['primaryPhone'] ?? '',
      profilePhoto: map['profilePhoto'] ?? '',
      secondaryPhone: map['secondaryPhone'] ?? '',
      socials: List<SocialLink>.from(
          map['socials']?.map((x) => SocialLink.fromMap(x))),
      website: map['website'] ?? '',
      createDate: map['createDate'],
      style: CardStyle.values.byName(map['style']),
      cardBackImg: map['cardBackImg'],
      cardFrontImg: map['cardFrontImg'],
      themeMode: _toThemeMode(map['themeMode']),
    );
  }

  factory CardModel.fromDoc(DocumentSnapshot doc) {
    return CardModel(
      docId: doc.id,
      cardId: doc['cardId'],
      about: doc['about'],
      userId: doc['userId'],
      bio: doc['bio'],
      coverImg: doc['coverImg'],
      email: doc['email'],
      gallery: List<String>.from(doc['gallery']),
      name: doc['name'],
      primaryPhone: doc['primaryPhone'],
      profilePhoto: doc['profilePhoto'],
      secondaryPhone: doc['secondaryPhone'],
      socials: List<SocialLink>.from(
          doc['socials']?.map((x) => SocialLink.fromMap(x))),
      website: doc['website'],
      createDate: (doc['createDate'] as Timestamp).toDate(),
      style: CardStyle.values.byName(doc['style']),
      cardBackImg: doc['cardBackImg'],
      cardFrontImg: doc['cardFrontImg'],
      themeMode: _toThemeMode(doc['themeMode']),
    );
  }

  static CardModel empty = CardModel(
    userId: '',
    name: '',
    primaryPhone: '',
    secondaryPhone: null,
    email: '',
    profilePhoto: '',
    coverImg: '',
    gallery: const [],
    socials: const [],
    website: '',
    about: '',
    bio: '',
    cardId: '',
    createDate: DateTime.now(),
    style: CardStyle.classic,
    cardBackImg: '',
    cardFrontImg: '',
    themeMode: ThemeMode.light,
  );

  final String docId;
  final String userId;
  final String cardId;
  final String name;
  final String email;
  final String coverImg;
  final String primaryPhone;
  final String? secondaryPhone;
  final String profilePhoto;
  final List<String> gallery;
  final List<SocialLink> socials;
  final String website;
  final String about;
  final String bio;
  final DateTime createDate;
  final String cardFrontImg;
  final String cardBackImg;
  final CardStyle style;
  final ThemeMode themeMode;

  CardModel toggleMode() {
    return CardModel(
      docId: docId,
      about: about,
      userId: userId,
      bio: bio,
      coverImg: coverImg,
      email: email,
      gallery: gallery,
      name: name,
      primaryPhone: primaryPhone,
      profilePhoto: profilePhoto,
      secondaryPhone: secondaryPhone,
      socials: socials,
      website: website,
      createDate: createDate,
      cardId: cardId,
      style: style,
      cardBackImg: cardBackImg,
      cardFrontImg: cardFrontImg,
      themeMode: themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
    );
  }

  CardModel copyWith({
    String? about,
    String? bio,
    String? coverImg,
    String? email,
    List<String>? gallery,
    String? name,
    String? primaryPhone,
    String? profilePhoto,
    String? Function()? secondaryPhone,
    List<SocialLink>? socials,
    String? website,
    String? userId,
    String? cardId,
    DateTime? createDate,
    CardStyle? style,
    String? cardFrontImg,
    String? cardBackImg,
    ThemeMode? themeMode,
  }) {
    return CardModel(
      docId: docId,
      about: about ?? this.about,
      userId: userId ?? this.userId,
      bio: bio ?? this.bio,
      coverImg: coverImg ?? this.coverImg,
      email: email ?? this.email,
      gallery: gallery ?? this.gallery,
      name: name ?? this.name,
      primaryPhone: primaryPhone ?? this.primaryPhone,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      secondaryPhone:
          secondaryPhone == null ? this.secondaryPhone : secondaryPhone(),
      socials: socials ?? this.socials,
      website: website ?? this.website,
      createDate: createDate ?? this.createDate,
      cardId: cardId ?? this.cardId,
      style: style ?? this.style,
      cardBackImg: cardBackImg ?? this.cardBackImg,
      cardFrontImg: cardFrontImg ?? this.cardFrontImg,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'about': about});
    result.addAll({'bio': bio});
    result.addAll({'coverImg': coverImg});
    result.addAll({'email': email});
    result.addAll({'gallery': gallery});
    result.addAll({'name': name});
    result.addAll({'primaryPhone': primaryPhone});
    result.addAll({'profilePhoto': profilePhoto});
    result.addAll({'secondaryPhone': secondaryPhone});
    result.addAll({'socials': socials.map((x) => x.toMap()).toList()});
    result.addAll({'website': website});
    result.addAll({'userId': userId});
    result.addAll({'createDate': createDate});
    result.addAll({'cardId': cardId});
    result.addAll({'style': style.name});
    result.addAll({'cardFrontImg': cardFrontImg});
    result.addAll({'cardBackImg': cardBackImg});
    result.addAll({'themeMode': themeMode.name});

    return result;
  }

  static ThemeMode _toThemeMode(String name) => switch (name) {
        'dark' => ThemeMode.dark,
        'light' => ThemeMode.light,
        _ => ThemeMode.light,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CardModel &&
        other.docId == docId &&
        other.userId == userId &&
        other.cardId == cardId &&
        other.name == name &&
        other.email == email &&
        other.coverImg == coverImg &&
        other.primaryPhone == primaryPhone &&
        other.secondaryPhone == secondaryPhone &&
        other.profilePhoto == profilePhoto &&
        listEquals(other.gallery, gallery) &&
        listEquals(other.socials, socials) &&
        other.website == website &&
        other.about == about &&
        other.bio == bio &&
        other.createDate == createDate &&
        other.cardFrontImg == cardFrontImg &&
        other.cardBackImg == cardBackImg &&
        other.style == style &&
        other.themeMode == themeMode;
  }

  @override
  int get hashCode {
    return docId.hashCode ^
        userId.hashCode ^
        cardId.hashCode ^
        name.hashCode ^
        email.hashCode ^
        coverImg.hashCode ^
        primaryPhone.hashCode ^
        secondaryPhone.hashCode ^
        profilePhoto.hashCode ^
        gallery.hashCode ^
        socials.hashCode ^
        website.hashCode ^
        about.hashCode ^
        bio.hashCode ^
        createDate.hashCode ^
        cardFrontImg.hashCode ^
        cardBackImg.hashCode ^
        style.hashCode ^
        themeMode.hashCode;
  }
}
