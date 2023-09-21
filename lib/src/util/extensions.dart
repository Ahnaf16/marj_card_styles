import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ContextEx on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);

  double get height => mq.size.height;

  double get width => mq.size.width;

  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorTheme => theme.colorScheme;

  Brightness get bright => theme.brightness;

  bool get isDark => bright == Brightness.dark;
  bool get isLight => bright == Brightness.light;

  get pop => Navigator.canPop(this) ? Navigator.pop(this) : null;
}

extension LayoutEx on BuildContext {
  bool get isSmall => width <= 600;

  int get kCrossAxisCount {
    if (isSmall) return 2;
    return 4;
  }

  int crossAxisCustom(int small, int large) {
    if (isSmall) return small;

    return large;
  }

  double adaptiveWidth({double? small, double? large}) {
    if (isSmall) return small ?? width;

    return large ?? 700;
  }
}

extension DateTimeFormat on DateTime {
  String formatDate([String pattern = 'dd-MM-yyyy']) =>
      DateFormat(pattern).format(this);
}

extension StringEx on String {
  int get asInt {
    final replaced = replaceAll(RegExp('[^0-9]'), '');
    return replaced.isEmpty ? 0 : int.parse(replaced);
  }

  double get asDouble => isEmpty ? 0.0 : double.parse(this);

  String showUntil(int end, [int start = 0]) =>
      length >= end ? '${substring(start, end)}...' : this;

  String get toTitleCase {
    List<String> words = split(' ');

    String capitalizedText = ' ';

    for (int i = 0; i < words.length; i++) {
      capitalizedText += words[i][0].toUpperCase() + words[i].substring(1);
      if (i < words.length - 1) {
        capitalizedText += ' ';
      }
    }
    return capitalizedText.trim();
  }

  String ifEmpty([String? emptyText = 'Empty']) =>
      isEmpty ? '$emptyText' : this;

  bool get isValidURL {
    final reg = RegExp(
      r'^(http(s):\/\/.)[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)$',
    );
    return reg.hasMatch(this);
  }

  bool get isValidEmail {
    final reg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return reg.hasMatch(this);
  }

  bool get isValidPhone {
    final reg = RegExp(r'(\+8801\d{9})|(01\d{9})');
    return reg.hasMatch(this);
  }

  bool get isWebFile => startsWith('blob:');
}

extension DocEx on DocumentSnapshot {
  bool containsKey(String key) => (data() as Map).containsKey(key);
}

extension ListEx<T> on List<T> {
  int index(T value) => indexWhere((element) => element == value);

  List<T> addImmutable(T value) => [...this, value];

  List<T> removeImmutable(T value) =>
      [...sublist(0, index(value)), ...sublist(index(value) + 1)];

  List<T> replaceImmutable(int index, T replacement) =>
      [...sublist(0, index), replacement, ...sublist(index + 1)];
}
