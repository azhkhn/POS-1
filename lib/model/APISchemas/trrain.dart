
class TrainDetail {

  final String? message;
  final String? imglink;
  final String status;

  const TrainDetail({
    required this.message,
    required this.imglink,
    required this.status
  });

  
  factory TrainDetail.fromJson(Map<String, dynamic> json) {
    return TrainDetail(
      message: json['msg'],
      imglink: json['imgLink'] ,
      status: json['status']
    );
  }
}
