import 'package:bb_app/model/hotel_model/hotel_model.dart';
import 'package:bb_app/services/hotel_data_service/hotel_list_request_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

enum SortType { lowToHigh, highToLow, sortByVicinity }

class HotelListViewModel extends ChangeNotifier {
  SortType? sortType;
  List<HotelModel> hotelList = [];
  bool? isConnectionOk;
  HotelListViewModel(context) {
    sortType = SortType.lowToHigh;
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

  sortHotelTypeSetter(SortType type, context) {
    if (sortType != type&&hotelList.isNotEmpty) {
      sortType = type;
      type == SortType.lowToHigh
          ? hotelList.sort((a, b) => a.price!.compareTo(b.price as int))
          : sortType == SortType.highToLow
              ? hotelList.sort((a, b) => b.price!.compareTo(a.price as int))
              : hotelList.sort((a, b) => a.price!.compareTo(b.price as int));
    }
    notifyListeners();
  }
}
