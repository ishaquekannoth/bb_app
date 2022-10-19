import 'package:bb_app/model/hotel_model/hotel_model.dart';
import 'package:bb_app/services/registration_services/hotel_data_service/hotel_list_request_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HotelListViewModel extends ChangeNotifier {
  List<HotelModel> hotelList = [];
  bool? isConnectionOk;
  HotelListViewModel(context) {
    fetchAllHotels(context);
  }
  fetchAllHotels(context) async {
    isConnectionOk = await InternetConnectionChecker().hasConnection;
    final dataList = await HotelListRequest().getHotelList(context);
    if (dataList != null) {
      hotelList.clear();
      hotelList.addAll(dataList);
      notifyListeners();
    }
  }
}
