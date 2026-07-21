class Driver {
  final String id;
  final String name;
  final String imageUrl;
  final String distance;
  final double rating;
  final int reviews;
  final bool verified;
  final bool online;
  bool liked;

  Driver({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.distance,
    required this.rating,
    required this.reviews,
    required this.verified,
    required this.online,
    this.liked = false,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      imageUrl: json['image_url'] ?? '',
      distance: json['distance'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      reviews: json['reviews'] ?? 0,
      verified: json['verified'] ?? false,
      online: json['online'] ?? false,
      liked: json['liked'] ?? false,
    );
  }
}