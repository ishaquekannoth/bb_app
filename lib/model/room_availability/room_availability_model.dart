import 'package:flutter/material.dart';

class RoomAvailabiltyRequestModel {
  String hotelId;
  DateTimeRange dateTimeRange;
  int numberOfRooms;

  RoomAvailabiltyRequestModel(
      {required this.dateTimeRange,
      required this.hotelId,
      required this.numberOfRooms});

  Map<String, dynamic> toJson() {
    return {
      "hotelId": hotelId,
      "startDate": dateTimeRange.start.toIso8601String(),
      "endDate": dateTimeRange.end.toIso8601String(),
      "roomsCount": numberOfRooms
    };
  }
}

class RoomAvailabilityResponseModel {
  bool isAvailable;
  String? message;

  RoomAvailabilityResponseModel({required this.isAvailable, this.message});

  factory RoomAvailabilityResponseModel.fromJson(Map<String, dynamic> json) {
    return RoomAvailabilityResponseModel(
        isAvailable: json["suceess"], message: json["message"]??"");
  }
}
