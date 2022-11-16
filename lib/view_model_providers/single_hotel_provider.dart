import 'package:bb_app/model/room_availability/room_availability_model.dart';
import 'package:flutter/material.dart';

import '../services/availability_check/room_availability._checker_service.dart';

class SingleHotelViewModel with ChangeNotifier {
  DateTimeRange? pickedDate;
  int _totalRooms = 0;
  bool? _isRoomAvailable = false;
  bool isActivelyChecking = false;
  SingleHotelViewModel() {
    pickedDate = DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now().add(const Duration(days: 1)));
  }

  onInit(String hotelId, context) {
    _isRoomAvailable = false;
    pickedDate = DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now().add(const Duration(days: 1)));
    _totalRooms = 0;
    checkAvailability(
        RoomAvailabiltyRequestModel(
            dateTimeRange: dateTimeRange,
            hotelId: hotelId,
            numberOfRooms: _totalRooms),
        context);
    notifyListeners();
  }

  onDateSelector({context, required String hotelId}) async {
    pickedDate = await showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 30)));
    if (pickedDate == null) {
      return;
    }
    notifyListeners();
    checkAvailability(
        RoomAvailabiltyRequestModel(
            dateTimeRange: dateTimeRange,
            hotelId: hotelId,
            numberOfRooms: _totalRooms),
        context);
  }

  onSelectGuests({required int rooms, required String hotelId, context}) {
    _totalRooms = rooms;
    checkAvailability(
        RoomAvailabiltyRequestModel(
            dateTimeRange: dateTimeRange,
            hotelId: hotelId,
            numberOfRooms: _totalRooms),
        context);

    notifyListeners();
  }

  Future<void> checkAvailability(
      RoomAvailabiltyRequestModel roomAvailabiltyRequest, context) async {
    isActivelyChecking = true;
    notifyListeners();
    _isRoomAvailable = await RoomAvailabilityService()
        .isRooomAvailable(roomAvailabiltyRequest, context);
    isActivelyChecking = false;
    notifyListeners();
  }

  bool get roomAvailability => _isRoomAvailable ?? false;
  int get totalRooms => _totalRooms;
  DateTimeRange get dateTimeRange =>
      pickedDate ??
      DateTimeRange(
          start: DateTime.now(),
          end: DateTime.now().add(const Duration(days: 1)));
}
