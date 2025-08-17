import '../../../video_players/model/video_model.dart';

class ListResponse {
  final bool status;
  final String? message;
  final String? name;
  List<VideoPlayerModel>? data;

  ListResponse({
    this.status = false,
    this.message = "",
    this.name,
    required this.data,
  });
  // static  ListResponse empty = ListResponse(
  //   status: false,
  //   message: "",
  //   data: [],
  // );

  factory ListResponse.fromJson(Map<String, dynamic> json) {
    return ListResponse(
      status: json['status'] is bool ? json['status'] : false,
      message: json['message'] is String ? json['message'] : "",
      name: json['name'] is String ? json['name'] : null,
      data: json['data'] is List ? List<VideoPlayerModel>.from(json['data'].map((x) => VideoPlayerModel.fromJson(x))) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'name': name,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}
