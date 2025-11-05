class UserModel {
  final String id;
  final String name;
  final String? phone;

  UserModel({required this.id, required this.name, this.phone});

  factory UserModel.fromJson(Map<String, dynamic> j) =>
      UserModel(id: j['id'], name: j['name'], phone: j['phone']);
}

