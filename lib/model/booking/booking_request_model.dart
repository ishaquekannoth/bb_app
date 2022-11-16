import 'package:flutter/material.dart';

class BookingRequestModel {
  String hotelId;
  String? phoneNumber;
  String? name;
  String token;
  int numberOfrooms;
  DateTimeRange dateTimeRange;
  BookingRequestModel(
      {required this.dateTimeRange,
      required this.token,
      required this.hotelId,
      required this.numberOfrooms,
      this.name,
      this.phoneNumber});

  Map<String, dynamic> toJson() {
    return {
      "hotel": hotelId,
      "phone_number": phoneNumber??"",
      "name": name??"",
      "start": dateTimeRange.start.toIso8601String(),
      "end": dateTimeRange.end.toIso8601String(),
      "room": numberOfrooms
    };
  }
}
