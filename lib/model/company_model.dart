class CompanyModel {
  String name;
  DateTime createDate;
  int id;
  String logo;
  CompanyModel({
    required this.name,
    required this.createDate,
    required this.id,
    required this.logo,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'createDate': createDate.millisecondsSinceEpoch});
    result.addAll({'id': id});
    result.addAll({'logo': logo});

    return result;
  }

  factory CompanyModel.fromMap(map) {
    return CompanyModel(
      name: map['name'] ?? '',
      createDate: DateTime.fromMillisecondsSinceEpoch(map['createDate']),
      id: map['id']?.toInt() ?? 0,
      logo: map['logo'] ?? '',
    );
  }
}
