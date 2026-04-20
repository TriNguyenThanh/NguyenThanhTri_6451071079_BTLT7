class Cau6ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final String brand;
  final String thumbnail;

  const Cau6ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.brand,
    required this.thumbnail,
  });

  factory Cau6ProductModel.fromJson(Map<String, dynamic> json) {
    return Cau6ProductModel(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse((json['id'] ?? '').toString()) ?? 0,
      title: (json['title'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
      price: (json['price'] as num?)?.toDouble() ?? 0,
      brand: (json['brand'] ?? '').toString(),
      thumbnail: (json['thumbnail'] ?? '').toString(),
    );
  }
}
