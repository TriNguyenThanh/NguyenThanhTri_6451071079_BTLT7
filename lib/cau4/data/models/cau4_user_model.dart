class Cau4UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  const Cau4UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });

  factory Cau4UserModel.fromJson(Map<String, dynamic> json) {
    return Cau4UserModel(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse((json['id'] ?? '').toString()) ?? 0,
      name: (json['name'] ?? '').toString(),
      username: (json['username'] ?? '').toString(),
      email: (json['email'] ?? '').toString(),
      phone: (json['phone'] ?? '').toString(),
      website: (json['website'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
      'website': website,
    };
  }
}
