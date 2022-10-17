import 'package:bb_app/model/hotel_model/hotel_model.dart';
import 'package:bb_app/services/registration_services/hotel_data_service/hotel_list_request_service.dart';
import 'package:flutter/cupertino.dart';

class HotelListViewModel extends ChangeNotifier {
  List<HotelModel> hotelList = [];
  List<HotelModel> dummyList = [
    HotelModel(
        property: Property(propertyName: "No Data", city: "Not Available"),
        isBlocked: false,
        images: [
          [Images(url: "")]
        ])
  ];
  HotelListViewModel() {
    fetchAllHotels();
  }
  fetchAllHotels() async {
    final dataList = await HotelListRequest().getHotelList();

    hotelList.clear();
    hotelList.addAll(dataList);
    notifyListeners();
  }
}
