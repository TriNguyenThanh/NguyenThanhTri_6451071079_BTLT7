class Post {
  final String id;
  final String title;
  final String body;
  final int userId;
  final DateTime? createdAt;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: (json['id'] ?? '').toString(),
      title: (json['title'] ?? '').toString(),
      body: (json['body'] ?? '').toString(),
      userId: int.tryParse((json['userId'] ?? 0).toString()) ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'userId': userId,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}
