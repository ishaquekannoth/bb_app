import 'package:bb_app/model/hotel_model/hotel_model.dart';
import 'package:bb_app/services/registration_services/hotel_data_service/hotel_list_request_service.dart';
import 'package:flutter/cupertino.dart';

class HotelListViewModel extends ChangeNotifier {
  List<HotelModel> hotelList = [];
  fetchAllHotels() async {
    final dataList = await HotelListRequest().getHotelList() ?? [];
    if (dataList.isEmpty) {
      hotelList.add(HotelModel());
    } else {
      hotelList.clear();
      hotelList.addAll(dataList);
    }
    notifyListeners();
  }
}
