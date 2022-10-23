import 'package:bb_app/model/hotel_model/hotel_model.dart';
import 'package:bb_app/services/hotel_data_service/hotel_list_request_service.dart';
import 'package:flutter/cupertino.dart';

enum HotelSortType { sortByHotels, sortByResort, sortByhomeStay }

enum PriceSortType {
  lowToHigh,
  highToLow,
}

class HotelListViewModel extends ChangeNotifier {
  HotelSortType? hotelSortType;
  PriceSortType? priceSortType;
  bool isLoading = false;
  List<HotelModel> hotelList = [];
  List<HotelModel> mainList = [];
  HotelListViewModel(context) {
    fetchAllHotels(context);
  }
  fetchAllHotels(context) async {
    final dataList = await HotelListRequest().getHotelList(context);
    if (dataList != null) {
      mainList.clear();
      mainList.addAll(dataList);
      hotelList.clear();
      hotelList.addAll(dataList);
    }
    isLoading = false;
    notifyListeners();
  }

  void priceSort(PriceSortType type) {
    priceSortType = type;
    if (hotelList.isNotEmpty) {
      if (type == PriceSortType.lowToHigh) {
        hotelList.sort((a, b) => a.price!.compareTo(b.price as int));
      } else {
        hotelList.sort((a, b) => b.price!.compareTo(a.price as int));
      }
      notifyListeners();
    }
  }

  void hotelTypesort(HotelSortType type, context) {
    hotelList.clear();
    hotelList.addAll(mainList);
    hotelSortType = type;
    if (hotelList.isNotEmpty) {
      switch (hotelSortType) {
        case HotelSortType.sortByHotels:
          {
            hotelList.clear();
            for (var element in mainList) {
              if (element.category!.category.toString() == "Hotels") {
                hotelList.add(element);
              }
            }
          }
          break;
        case HotelSortType.sortByResort:
          {
            hotelList.clear();
            for (var element in mainList) {
              if (element.category!.category == "Resort") {
                hotelList.add(element);
              }
            }
          }
          break;
        case HotelSortType.sortByhomeStay:
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
    priceSort(PriceSortType.lowToHigh);
    notifyListeners();
  }

  isloadingToggler() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
