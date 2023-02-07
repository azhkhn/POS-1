import 'dart:convert';

class User {

  final String branchId;
  final String agency;
  final String tlId;
  final String dealerId;
  final String empName;
  final String appId;

  const User({
    required this.branchId,
    required this.agency,
    required this.tlId,
    required this.dealerId,
    required this.empName,
    required this.appId,
  });

  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //     branchId: json['id'],
  //     agency: json['title'],
  //     tlId: json['tlId'],
  //     dealerId: json['dealerId'],
  //     empName: json['empName'],
  //      appId: json['appId'],
  //   );
  // }

  User copyWith({
    String? branchId,
    String? agency,
    String? tlId,
    String? dealerId,
    String? empName,
    String? appId,
  }) {
    return User(
      branchId: branchId ?? this.branchId,
      agency: agency ?? this.agency,
      tlId: tlId ?? this.tlId,
      dealerId: dealerId ?? this.dealerId,
      empName: empName ?? this.empName,
      appId: appId ?? this.appId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'branchId': branchId,
      'agency': agency,
      'tlId': tlId,
      'dealerId': dealerId,
      'empName': empName,
      'appId': appId,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      branchId: map['branchId'] ?? '',
      agency: map['agency'] ?? '',
      tlId: map['tlId'] ?? '',
      dealerId: map['dealerId'] ?? '',
      empName: map['empName'] ?? '',
      appId: map['appId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(branchId: $branchId, agency: $agency, tlId: $tlId, dealerId: $dealerId, empName: $empName, appId: $appId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.branchId == branchId &&
      other.agency == agency &&
      other.tlId == tlId &&
      other.dealerId == dealerId &&
      other.empName == empName &&
      other.appId == appId;
  }

  @override
  int get hashCode {
    return branchId.hashCode ^
      agency.hashCode ^
      tlId.hashCode ^
      dealerId.hashCode ^
      empName.hashCode ^
      appId.hashCode;
  }
}
