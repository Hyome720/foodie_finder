class Restaurant {
  final String name;
  final String address;
  final double rating;

  Restaurant({required this.name, required this.address, required this.rating});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json['title'],
      address: json['roadAddress'],
      rating: json['userRating']?.toDouble() ?? 0.0,
    );
  }
}
