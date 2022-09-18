class UserModel {
  int branchId;
  int companyId;
  String companyName;
  String email;
  String id;
  bool isActive;
  double lat;
  double long;
  String name;
  String password;
  String permision;
  double personalSales;
  String phone;
  UserModel({
    required this.branchId,
    required this.companyId,
    required this.companyName,
    required this.email,
    required this.id,
    required this.isActive,
    required this.lat,
    required this.long,
    required this.name,
    required this.password,
    required this.permision,
    required this.personalSales,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'branchId': branchId});
    result.addAll({'companyId': companyId});
    result.addAll({'companyName': companyName});
    result.addAll({'email': email});
    result.addAll({'id': id});
    result.addAll({'isActive': isActive});
    result.addAll({'lat': lat});
    result.addAll({'long': long});
    result.addAll({'name': name});
    result.addAll({'password': password});
    result.addAll({'permision': permision});
    result.addAll({'personalSales': personalSales});
    result.addAll({'phone': phone});

    return result;
  }

  factory UserModel.fromMap(map) {
    return UserModel(
      branchId: map['branchId']?.toInt() ?? 0,
      companyId: map['companyId']?.toInt() ?? 0,
      companyName: map['companyName'] ?? '',
      email: map['email'] ?? '',
      id: map['id'] ?? '',
      isActive: map['isActive'] ?? false,
      lat: map['lat']?.toDouble() ?? 0.0,
      long: map['long']?.toDouble() ?? 0.0,
      name: map['name'] ?? '',
      password: map['password'] ?? '',
      permision: map['permision'] ?? '',
      personalSales: map['personalSales']?.toDouble() ?? 0.0,
      phone: map['phone'] ?? '',
    );
  }
}
