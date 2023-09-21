class SocialLink {
  const SocialLink({
    required this.name,
    required this.url,
    required this.logo,
  });

  factory SocialLink.fromMap(Map<String, dynamic> map) {
    return SocialLink(
      logo: map['logo'] ?? '',
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  final String name;
  final String logo;
  final String url;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'logo': logo});
    result.addAll({'name': name});
    result.addAll({'url': url});

    return result;
  }

  SocialLink copyWith({
    String? name,
    String? logo,
    String? url,
  }) {
    return SocialLink(
      name: name ?? this.name,
      logo: logo ?? this.logo,
      url: url ?? this.url,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SocialLink &&
        other.name == name &&
        other.logo == logo &&
        other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ logo.hashCode ^ url.hashCode;
}
