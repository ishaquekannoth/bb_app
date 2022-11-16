class BookingResponseModel {
  BookingResponseModel({this.success, this.response, this.message});

  bool? success;
  Response? response;
  String? message;

  factory BookingResponseModel.fromJson(Map<String, dynamic> json) =>
      BookingResponseModel(
        success: json["success"],
        response: Response.fromJson(json["response"]),
      );
}

class Response {
  Response({
    this.user,
    this.room,
    this.roomNumber,
    this.days,
    this.isBooked,
    this.completed,
    this.cancel,
    this.id,
    this.v,
  });

  String? user;
  String? room;
  int? roomNumber;
  String? days;
  bool? isBooked;
  bool? completed;
  bool? cancel;
  String? id;
  int? v;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        user: json["user"] ?? "",
        room: json["room"] ?? "",
        roomNumber: json["roomNumber"] ?? "",
        days: json["days"] ?? "0",
        isBooked: json["isBooked"] ?? false,
        completed: json["completed"] ?? false,
        cancel: json["cancel"] ?? false,
        id: json["_id"],
        v: json["__v"],
      );
}
