// const String tableNotes = 'notes';

// class NoteFields {
//   static final List<String> values = [
//     id,
//     branchId,
//     agency,
//     tlId,
//     dealerId,
//     empName,
//     appId,
//     loginId,
//     otp,
//     dealerName,
//     address,
//     designation,
//     noticeBoard
//   ];

//   static const String id = '_id';
//   static const String branchId = 'branchId';
//   static const String agency = 'agency';
//   static const String tlId = 'tlId';
//   static const String dealerId = 'dealerId';
//   static const String empName = 'empName';
//   static const String appId = 'appId';
//   static const String loginId = 'loginId';
//   static const String otp = 'otp';
//   static const String dealerName = 'DealerName';
//   static const String address = 'DealerAddress';
//   static const String designation = 'Designation';
//   static const String noticeBoard = 'NoticeBoard';
// }

// class Note {
//   final int? id;
//   final String branchId;
//   final String agency;
//   final String tlId;
//   final String dealerId;
//   final String empName;
//   final String appId;
//   final String loginId;
//   final String otp;
//   final String dealerName;
//   final String address;
//   final String designation;
//   final String noticeBoard;

//   const Note(
//       {this.id,
//       required this.branchId,
//       required this.agency,
//       required this.tlId,
//       required this.dealerId,
//       required this.empName,
//       required this.appId,
//       required this.loginId,
//       required this.otp,
//       required this.dealerName,
//       required this.address,
//       required this.designation,
//       required this.noticeBoard });

//   factory Note.fromJsonApi(Map<String, dynamic> json) {
//     return Note(
//       id: json['id'],
//       branchId: json['branchId'],
//       agency: json['agency'],
//       tlId: json['tlId'],
//       dealerId: json['dealerId'],
//       empName: json['empName'],
//       appId: json['appId'],
//       loginId: json['loginId'],
//       otp: json['otp'],
//       address: json['address'],
//       dealerName: json['dealerName'],
//       designation: json['designation'],
//       noticeBoard: json['noticeBoard']
//     );
//   }

//   // Note copy({
//   //   int? id,
//   //   int? age,
//   //   String? name,
//   // }) =>
//   //     Note(
//   //       id: id ?? this.id,
//   //       age: age ?? this.age,
//   //       name: name ?? this.name,
//   //     );

//   Map<String, dynamic> toMap() {
//     return {
//       'branchId': branchId,
//       'agency': agency,
//       'tlId': tlId,
//       'dealerId': dealerId,
//       'empName': empName,
//       'appId': appId,
//       'loginId': loginId,
//       'otp' : otp,
//       'dealerName ':dealerName ,
//       'address    ':address     ,
//       'designation':designation ,
//       'noticeBoard':noticeBoard  

//     };
//   }

//   Note copy(
//       {int? id,
//       String? branchId,
//       String? agency,
//       String? tlId,
//       String? dealerId,
//       String? empName,
//       String? appId,
//       String? loginId,
//       String? otp,
//       String? dealerName,
//       String? address,
//       String? designation,
//       String? noticeBoard }) {
//     return Note(
//       id: id ?? this.id,
//       branchId: branchId ?? this.branchId,
//       agency: agency ?? this.agency,
//       tlId: tlId ?? this.tlId,
//       dealerId: dealerId ?? this.dealerId,
//       empName: empName ?? this.empName,
//       appId: appId ?? this.appId,
//       loginId: loginId ?? this.loginId,
//       otp: otp ?? this.otp,
//       address: address ?? this.address,
//       dealerName: dealerName ?? this.dealerName,
//       designation: designation ?? this.designation,
//       noticeBoard: noticeBoard ?? this.noticeBoard,
//     );
//   }

//   static Note fromJsonDatabase(Map<String, Object?> json) => Note(
//       id: json[NoteFields.id] as int?,
//       branchId: json[NoteFields.branchId] as String,
//       agency: json[NoteFields.agency] as String,
//       tlId: json[NoteFields.tlId] as String,
//       dealerId: json[NoteFields.dealerId] as String,
//       empName: json[NoteFields.empName] as String,
//       appId: json[NoteFields.appId] as String,
//       loginId: json[NoteFields.loginId] as String,
//       otp: json[NoteFields.otp] as String,
//       address: json[NoteFields.address] as String,
//       dealerName: json[NoteFields.dealerName] as String,
//       designation: json[NoteFields.designation] as String,
//       noticeBoard: json[NoteFields.noticeBoard] as String
//       );

//   Map<String, Object?> toJson() => {
//         NoteFields.id: id,
//         NoteFields.branchId: branchId,
//         NoteFields.agency: agency,
//         NoteFields.tlId: tlId,
//         NoteFields.dealerId: dealerId,
//         NoteFields.empName: empName,
//         NoteFields.appId: appId,
//         NoteFields.loginId: loginId,
//         NoteFields.otp: otp,
//         NoteFields.address: address,
//         NoteFields.dealerName: dealerName,
//         NoteFields.designation: designation,
//         NoteFields.noticeBoard: noticeBoard
//       };
// }
