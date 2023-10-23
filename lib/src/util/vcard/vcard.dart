library vcard;

import 'dart:io';

import 'package:marj_card_styles/src/util/util.dart';

import 'vcard_formatter.dart';

class VCard {
  /// Specifies a value that represents a persistent, globally unique identifier associated with the vCard
  String? uid;

  DateTime? birthday;
  DateTime? anniversary;

  var cellPhone;

  /// Other cell phone number or pager
  var pagerPhone;
  var email;
  var workEmail;
  var otherEmail;

  String firstName = '';
  String middleName = '';
  String lastName = '';

  /// Formatted name string associated with the vCard object (will automatically populate if not set)
  String? formattedName;

  String namePrefix = '';
  String nameSuffix = '';
  String nickname = '';
  String? gender;
  MailingAddress homeAddress = MailingAddress('HOME');

  var homePhone;
  var homeFax;

  Photo photo = Photo();
  String? note;
  String? organization;
  Photo logo = Photo();
  String? role;
  Map<String, String> socialUrls = getSocialUrls();

  /// A URL that can be used to get the latest version of this vCard
  String? source;
  String? jobTitle;

  String? url;
  String? workUrl;
  MailingAddress workAddress = MailingAddress('WORK');
  var workPhone;
  var workFax;
  var otherPhone;
  bool isOrganization = false;
  String version = '3.0';

  int getMajorVersion() {
    String majorVersionString = version.split('.')[0];
    if (majorVersionString.isNumeric) {
      return int.parse(majorVersionString);
    }
    return 4;
  }

  /// Get formatted vCard
  /// @return {String} Formatted vCard in VCF format
  String getFormattedString() => VCardFormatter().getFormattedString(this);

  /// Save formatted vCard to file
  /// @param  {String} filename
  saveToFile(filename) async {
    String contents = getFormattedString();

    const path = '';
    final fs = File('$path/vCard/exports/$filename');
    fs.writeAsStringSync(contents);
  }

  static Map<String, String> getSocialUrls() {
    return {
      'facebook': '',
      'linkedin': '',
      'twitter': '',
      'instagram': '',
      'youtube': '',
    };
  }
}

class Photo {
  String? url;
  String? mediaType;
  bool? isBase64;

  attachFromUrl(String url, [String mediaType = 'PNG']) {
    this.url = url;
    this.mediaType = mediaType;
    isBase64 = false;
  }
}

class MailingAddress {
  /// Represents the actual text that should be put on the mailing label when delivering a physical package
  String label = '';
  String street = '';
  String city = '';
  String stateProvince = '';
  String postalCode = '';
  String countryRegion = '';

  final String type;

  MailingAddress(this.type);
}
