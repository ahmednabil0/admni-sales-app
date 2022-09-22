class BranshModel {
  String bransh;
  String companyName;
  int companyId;
  int branshId;
  double lat;
  double long;
  BranshModel({
    required this.bransh,
    required this.companyName,
    required this.companyId,
    required this.branshId,
    required this.lat,
    required this.long,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'bransh': bransh});
    result.addAll({'companyName': companyName});
    result.addAll({'companyId': companyId});
    result.addAll({'branshId': branshId});
    result.addAll({'lat': lat});
    result.addAll({'long': long});

    return result;
  }

  factory BranshModel.fromMap(map) {
    return BranshModel(
      bransh: map['bransh'] ?? '',
      companyName: map['companyName'] ?? '',
      companyId: map['companyId']?.toInt() ?? 0,
      branshId: map['branshId']?.toInt() ?? 0,
      lat: map['lat']?.toDouble() ?? 0.0,
      long: map['long']?.toDouble() ?? 0.0,
    );
  }
}
