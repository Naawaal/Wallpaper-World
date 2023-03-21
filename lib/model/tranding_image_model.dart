class Photo {
  int id;
  int width;
  int height;
  String url;
  String photographer;
  String photographerUrl;
  int photographerId;
  String avgColor;
  Src src;
  bool liked;
  String alt;

  Photo(
      {required this.id,
      required this.width,
      required this.height,
      required this.url,
      required this.photographer,
      required this.photographerUrl,
      required this.photographerId,
      required this.avgColor,
      required this.src,
      required this.liked,
      required this.alt});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] ?? 0, // default value of 0 if null
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
      url: json['url'] ?? '',
      photographer: json['photographer'] ?? '',
      photographerUrl: json['photographer_url'] ?? '',
      photographerId: json['photographer_id'] ?? 0,
      avgColor: json['avg_color'] ?? '',
      src: Src.fromJson(
        json['src'],
      ),
      liked: json['liked'] ?? false, // default value of false if null
      alt: json['alt'] ?? '',
    );
  }
}

class Src {
  String original;
  String large2x;
  String large;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;

  Src({
    required this.original,
    required this.large2x,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  factory Src.fromJson(Map<String, dynamic> json) {
    return Src(
      original: json['original'] ?? '',
      large2x: json['large2x'] ?? '',
      large: json['large'] ?? '',
      medium: json['medium'] ?? '',
      small: json['small'] ?? '',
      portrait: json['portrait'] ?? '',
      landscape: json['landscape'] ?? '',
      tiny: json['tiny'] ?? '',
    );
  }
}
