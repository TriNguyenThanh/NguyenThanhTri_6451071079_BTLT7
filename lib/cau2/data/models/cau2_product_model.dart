class Cau2ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;

  const Cau2ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
  });

  factory Cau2ProductModel.fromJson(Map<String, dynamic> json) {
    return Cau2ProductModel(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse(json['id'].toString()) ?? 0,
      title: (json['title'] ?? '').toString(),
      price: (json['price'] as num?)?.toDouble() ?? 0,
      description: (json['description'] ?? '').toString(),
    );
  }
}
