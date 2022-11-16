import 'package:bb_app/model/booking/booking_request_model.dart';
import 'package:bb_app/services/booking_service/hotel_booking_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HotelBookingViewModel extends ChangeNotifier {
  bool isLoading = false;

  void onBookNowPaymentModeSelection(
      BookingRequestModel data, FlutterSecureStorage secrets) async {
   
   
    await HotelBookingService().bookHotel(data, secrets);
  }
}
