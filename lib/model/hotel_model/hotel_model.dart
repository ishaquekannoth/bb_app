import 'package:flutter/cupertino.dart';

class HotelModel extends ChangeNotifier {
  final String hotelId;
  final String hotelName;
  final String imageUrl;
  final String hotelLocation;
  bool? isBooked;
  bool? isFavourite;

  HotelModel(
      {required this.hotelId,
      required this.hotelName,
      required this.hotelLocation,
      required this.imageUrl,
      this.isFavourite = false,
      this.isBooked});

  toggleFavourite() {
    isFavourite = !isFavourite!;
    notifyListeners();
  }
}
