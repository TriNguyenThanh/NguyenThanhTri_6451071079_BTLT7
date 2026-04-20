class Cau5TaskModel {
  final int id;
  final String title;
  final bool completed;

  const Cau5TaskModel({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Cau5TaskModel.fromJson(Map<String, dynamic> json) {
    return Cau5TaskModel(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse((json['id'] ?? '').toString()) ?? 0,
      title: (json['title'] ?? '').toString(),
      completed: (json['completed'] as bool?) ?? false,
    );
  }
}
