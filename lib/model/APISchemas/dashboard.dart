
import '../DatabaseModels/dashboarddata.dart';

class DashBoard {

  final int? id;
  final String dealername;
  final String dealeraddress;
  final List<String>? branchname;
  final String designation;
  final String noticeBoard;
  final String otp;
  final String? status;

  const DashBoard({
    this.id,
    required this.dealername,
    required this.dealeraddress,
    this.branchname,
    required this.designation,
    required this.otp,
    required this.noticeBoard,
    this.status
  });
  

  DashBoard copy({
    int? id,
    String? dealername,
    String? dealeraddress,
    List<String>? branchname,
    String? designation,
    String? noticeBoard,
    String? otp,
    String? status,
  }) {
    return DashBoard(
      id: id ?? this.id,
      dealername: dealername ?? this.dealername,
      dealeraddress: dealeraddress ?? this.dealeraddress,
      otp: otp ?? this.otp,
      branchname: branchname ?? this.branchname,
      designation: designation ?? this.designation,
      noticeBoard: noticeBoard ?? this.noticeBoard,
      status: status ?? this.status
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dealername': dealername,
      'dealeraddress': dealeraddress,
      'branchname': branchname,
      'designation': designation,
      'noticeBoard': noticeBoard,
      'otp' : otp
    };
  }

  factory DashBoard.fromJson(Map<String, dynamic> json) {
    return DashBoard(
      dealername: json['dealerName'],
      dealeraddress: json['address'],
      branchname: List<String>.from(json['branch']),
      otp: json['otp'],
      designation: json['designation'],
      noticeBoard: json['noticeBoard'],
      status: json['status']
    );
  }

    static DashBoard fromJsonDatabase(Map<String, Object?> json) => DashBoard(
      id: json[Dashboarddatafields.id] as int?,
      dealername: json[Dashboarddatafields.dealername] as String,
      dealeraddress: json[Dashboarddatafields.dealeraddress] as String,
      designation: json[Dashboarddatafields.designation] as String,
      otp: json[Dashboarddatafields.otp] as String,
      noticeBoard: json[Dashboarddatafields.noticeBoard] as String,
      );
  
  Map<String, Object?> toJson() => {
        Dashboarddatafields.id: id,
        Dashboarddatafields.dealername: dealername,
        Dashboarddatafields.dealeraddress: dealeraddress,
        Dashboarddatafields.designation: designation,
        Dashboarddatafields.otp : otp,
        Dashboarddatafields.noticeBoard: noticeBoard,
      };

}
