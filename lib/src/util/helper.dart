import 'package:fluttertoast/fluttertoast.dart';
import 'package:marj_card_styles/src/util/util.dart';
import 'package:url_launcher/url_launcher.dart';

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
    await launchUrl(Uri(scheme: 'https', path: url));
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
