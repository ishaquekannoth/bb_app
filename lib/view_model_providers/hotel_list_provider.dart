import 'package:bb_app/model/hotel_model/hotel_model.dart';
import 'package:bb_app/services/hotel_data_service/hotel_list_request_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

enum SortType {
  lowToHigh,
  highToLow,
  sortByHotels,
  sortByResort,
  sortByhomeStay
}

class HotelListViewModel extends ChangeNotifier {
  SortType? sortType;
  List<HotelModel> hotelList = [];
  List<HotelModel> mainList = [];
  bool? isConnectionOk;
  HotelListViewModel(context) {
    sortType = SortType.lowToHigh;
    fetchAllHotels(context);
  }
  fetchAllHotels(context) async {
    isConnectionOk = await InternetConnectionChecker().hasConnection;
    final dataList = await HotelListRequest().getHotelList(context);
    if (dataList != null) {
      mainList.clear();
      mainList.addAll(dataList);
      hotelList.clear();
      hotelList.addAll(dataList);
      notifyListeners();
    }
  }

  void sortHotelTypeSetter(SortType type, context) {
    hotelList.clear();
    hotelList.addAll(mainList);
    sortType = type;
    if (hotelList.isNotEmpty) {
      switch (sortType) {
        case SortType.lowToHigh:
          {
            hotelList.sort((a, b) => a.price!.compareTo(b.price as int));
          }
          break;
        case SortType.highToLow:
          {
            hotelList.sort((a, b) => b.price!.compareTo(a.price as int));
          }
          break;
        case SortType.sortByHotels:
          {
            hotelList.clear();
            for (var element in mainList) {
              if (element.category!.category.toString() == "Hotels") {
                hotelList.add(element);
              }
            }
          }
          break;
        case SortType.sortByResort:
          {
            hotelList.clear();
            for (var element in mainList) {
              if (element.category!.category == "Resort") {
                hotelList.add(element);
              }
            }
          }
          break;
          case SortType.sortByhomeStay:
          {
            hotelList.clear();
            for (var element in mainList) {
              if (element.category!.category == "HomeStay") {
                hotelList.add(element);
              }
            }
          }
          break;
        default:
          {
             hotelList.sort((a, b) => a.price!.compareTo(b.price as int));
          }
      }
    }

    notifyListeners();
  }
}
