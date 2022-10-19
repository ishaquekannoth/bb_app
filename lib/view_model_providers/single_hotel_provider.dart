import 'package:flutter/material.dart';

class SingleHotelViewModel extends ChangeNotifier {
  SingleHotelViewModel() {
    pickedDate = DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now().add(const Duration(days: 1)));
  }
  DateTimeRange? pickedDate;

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
}
