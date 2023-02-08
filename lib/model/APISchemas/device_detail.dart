
import '../DatabaseModels/devicedetaildata.dart';

class DeviceData {

  final int? id;
  final String dealername;
  final String dealeraddress;
  final List<String>? branchname;
  final String designation;
  final String noticeBoard;
  final String data;
  final String? status;

  const DeviceData({
    this.id,
    required this.dealername,
    required this.dealeraddress,
    this.branchname,
    required this.designation,
    required this.data,
    required this.noticeBoard,
    this.status
  });


  DeviceData copy({
    int? id,
    String? dealername,
    String? dealeraddress,
    List<String>? branchname,
    String? designation,
    String? noticeBoard,
    String? data,
    String? status,
  }) {
    return DeviceData(
        id: id ?? this.id,
        dealername: dealername ?? this.dealername,
        dealeraddress: dealeraddress ?? this.dealeraddress,
        data: data ?? this.data,
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
      'data' : data
    };
  }

  factory DeviceData.fromJson(Map<String, dynamic> json) {
    return DeviceData(
        dealername: json['dealerName'],
        dealeraddress: json['address'],
        branchname: List<String>.from(json['branch']),
        data: json['data'],
        designation: json['designation'],
        noticeBoard: json['noticeBoard'],
        status: json['status']
    );
  }

  static DeviceData fromJsonDatabase(Map<String, Object?> json) => DeviceData(
    id: json[Devicedetaildatafields.id] as int?,
    dealername: json[Devicedetaildatafields.dealername] as String,
    dealeraddress: json[Devicedetaildatafields.dealeraddress] as String,
    designation: json[Devicedetaildatafields.designation] as String,
    data: json[Devicedetaildatafields.data] as String,
    noticeBoard: json[Devicedetaildatafields.noticeBoard] as String,
  );

  Map<String, Object?> toJson() => {
    Devicedetaildatafields.id: id,
    Devicedetaildatafields.dealername: dealername,
    Devicedetaildatafields.dealeraddress: dealeraddress,
    Devicedetaildatafields.designation: designation,
    Devicedetaildatafields.data : data,
    Devicedetaildatafields.noticeBoard: noticeBoard,
  };

}
