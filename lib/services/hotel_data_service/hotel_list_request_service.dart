import 'dart:developer';

import 'package:bb_app/model/hotel_model/hotel_model.dart';
import 'package:bb_app/services/connection_checker.dart';
import 'package:bb_app/services/dio_services.dart';
import 'package:bb_app/utils/Url.dart';
import 'package:bb_app/view/common_widgets/show_snackbar_widget.dart';
import 'package:dio/dio.dart';

class HotelListRequest {
  Future<List<HotelModel>?> getHotelList(context) async {
    var connectionOk = await isConnectionOk();
  
    if (connectionOk) {
      try {
        final response = await DioService.getMethod(url: MyApiUrl.getRoom);
        log(response.toString());
        if (response.statusCode >= 200 || response.statusCode <= 299) {
          final dataList = (response.data as List).map((e) {
            return HotelModel.fromJson(e);
          }).toList();
          return dataList;
        }
      } on DioError catch (e) {
        if (e.response?.statusCode == 500) {
          return null;
        }
      } on Exception catch (_) {
        return null;
      }
    }
      
    ShowMyPopUp.popUpMessenger(context,
        message: "No Connection", type: PopUpType.toast);
    return null;
  }
}
