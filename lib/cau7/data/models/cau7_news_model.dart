class Cau7NewsModel {
  final int id;
  final String title;
  final String body;
  final int userId;

  const Cau7NewsModel({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory Cau7NewsModel.fromJson(Map<String, dynamic> json) {
    return Cau7NewsModel(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse((json['id'] ?? '').toString()) ?? 0,
      title: (json['title'] ?? '').toString(),
      body: (json['body'] ?? '').toString(),
      userId: json['userId'] is int
          ? json['userId'] as int
          : int.tryParse((json['userId'] ?? '').toString()) ?? 0,
    );
  }
}
