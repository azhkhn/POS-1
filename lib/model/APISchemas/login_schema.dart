
import '../DatabaseModels/userlogindata.dart';

class LoginData {

  final int? id;
  final String branchId;
  final String agency;
  final String tlId;
  
  final String dealerId;
  final String empName;
  final String appId;
  final String loginId;  //NOT returned BY API , ADDED Later after Response From API

  final String? status;


  const LoginData({
    this.id,
    required this.branchId,
    required this.agency,
    required this.tlId,
    required this.dealerId,
    required this.empName,
    required this.appId,
    required this.loginId,
    this.status,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      id: json['id'],
      status: json['status'], 
      agency: json['agency'],  
      appId: json['appId'],  
      branchId: json['branchId'],  
      dealerId: json['dealerId'],  
      empName: json['empName'],  
      tlId: json['tlId'], 
      loginId: json['loginId']
    );
  }

  LoginData copy({
    int? id,
    String? branchId,
    String? agency,
    String? tlId,
    String? dealerId,
    String? empName,
    String? appId,
    String? loginId,
    String? status,
  }) {
    return LoginData(
      id: id ?? this.id,
      branchId: branchId ?? this.branchId,
      agency: agency ?? this.agency,
      tlId: tlId ?? this.tlId,
      dealerId: dealerId ?? this.dealerId,
      empName: empName ?? this.empName,
      appId: appId ?? this.appId,
      loginId: loginId ?? this.loginId,
      status: status ?? this.status,
    );
  }

   static LoginData fromJsonDatabase(Map<String, Object?> json) => LoginData(
      id: json[LoginDatafields.id] as int?,
      branchId: json[LoginDatafields.branchId] as String,
      agency: json[LoginDatafields.agency] as String,
      tlId: json[LoginDatafields.tlId] as String,
      dealerId: json[LoginDatafields.dealerId] as String,
      empName: json[LoginDatafields.empName] as String,
      appId: json[LoginDatafields.appId] as String,
      loginId: json[LoginDatafields.loginId] as String,
      );

  Map<String, Object?> toJson() => {
        LoginDatafields.id: id,
        LoginDatafields.branchId: branchId,
        LoginDatafields.agency: agency,
        LoginDatafields.tlId: tlId,
        LoginDatafields.dealerId: dealerId,
        LoginDatafields.empName: empName,
        LoginDatafields.appId: appId,
        LoginDatafields.loginId: loginId,
      };
}
