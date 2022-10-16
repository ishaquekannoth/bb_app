import 'package:flutter/cupertino.dart';

class HotelModel extends ChangeNotifier{
  String hotelId;
  String hotelName;
  String imageUrl;
  String hotelLocation;
  bool? isBooked;
  HotelModel({
    required this.hotelId,
    required this.hotelName,
    required this.hotelLocation,
    required this.imageUrl,
    this.isBooked
  });
}
