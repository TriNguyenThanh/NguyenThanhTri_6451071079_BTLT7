class Cau1UserModel {
  final int id;
  final String name;
  final String email;

  const Cau1UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory Cau1UserModel.fromJson(Map<String, dynamic> json) {
    return Cau1UserModel(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse(json['id'].toString()) ?? 0,
      name: (json['name'] ?? '').toString(),
      email: (json['email'] ?? '').toString(),
    );
  }
}
