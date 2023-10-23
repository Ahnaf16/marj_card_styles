import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marj_card_styles/src/util/util.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../model/model.dart';
import 'vcard/vcard.dart';

class Toaster {
  static show(String message) {
    Fluttertoast.showToast(
      msg: message,
      timeInSecForIosWeb: 3,
      webBgColor: '#312624',
      webPosition: 'center',
    );
  }

  static remove() => Fluttertoast.cancel();
}

class URLHelper {
  static url(String url) async {
    await launchUrlString(url);
  }

  static call(String number) async {
    if (number.isValidPhone) {
      final parsed = number.startsWith('+88') ? number : '+88$number';
      await launchUrl(
        Uri(scheme: "tel", path: parsed),
      );
    } else {
      Toaster.show('Phone Number is not valid');
    }
  }

  static mail(String mail) async {
    if (mail.isValidEmail) {
      await launchUrl(
        Uri(scheme: "mailto", path: mail),
      );
    } else {
      Toaster.show('Email is not valid');
    }
  }

  static massage(String number) async {
    if (number.isValidPhone) {
      final parsed = number.startsWith('+88') ? number : '+88$number';
      try {
        launchUrl(
          Uri(
            scheme: "sms",
            path: "+88$parsed",
            queryParameters: <String, String>{
              'body': Uri.encodeComponent(''),
            },
          ),
        );
      } on Exception catch (e) {
        Toaster.show(e.toString());
      }
    } else {
      Toaster.show('Phone Number is not valid');
    }
  }
}

class VCardManage {
  const VCardManage._();

  static downloadCard(CardModel card) async {
    final vCardData = await _createVCard(card);
    if (kIsWeb) {
      final blob = html.Blob([Uint8List.fromList(vCardData.codeUnits)]);
      html.AnchorElement(href: html.Url.createObjectUrlFromBlob(blob))
        ..setAttribute('download', '${card.name}.vcf')
        ..click();
    } else {
      final filePath = '/storage/emulated/0/Download/vCards/${card.name}.vcf';
      final file = File(filePath);
      await file.writeAsBytes(Uint8List.fromList(vCardData.codeUnits));

      return filePath;
    }
  }

  static Future<String> _createVCard(CardModel card) async {
    final vcard = VCard();
    final photo = Photo()..attachFromUrl(card.profilePhoto);

    vcard
      ..firstName = card.name
      ..homePhone = card.primaryPhone
      ..workPhone = card.secondaryPhone ?? ''
      ..email = card.email
      ..photo = photo
      ..url = card.website
      ..socialUrls = {for (var e in card.socials) e.name: e.url}
      ..note = 'Created with MARJ NFC';

    final vCardData = vcard.getFormattedString();

    return vCardData;
  }
}
