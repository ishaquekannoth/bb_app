import 'package:flutter/material.dart';

class SingleHotelViewModel with ChangeNotifier {
  DateTimeRange? pickedDate;
  int guests = 0;

  SingleHotelViewModel() {
    pickedDate = DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now().add(const Duration(days: 1)));
  }

  onInit() {
    pickedDate = DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now().add(const Duration(days: 1)));
    guests = 0;
    notifyListeners();
  }

  onDateSelector(context) async {
    pickedDate = await showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 30)));
    if (pickedDate == null) {
      return;
    }
    notifyListeners();
  }

  onSelectGuests(int guests) {
    this.guests = guests;
    notifyListeners();
  }
}
