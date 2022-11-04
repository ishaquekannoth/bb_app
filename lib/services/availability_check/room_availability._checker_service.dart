import 'package:bb_app/model/room_availability/room_availability_model.dart';
import 'package:bb_app/services/connection_checker.dart';
import 'package:bb_app/services/dio_services.dart';
import 'package:bb_app/utils/url.dart';
import 'package:dio/dio.dart';

import '../../view/common_widgets/show_snackbar_widget.dart';

class RoomAvailabilityService {
  Future<bool?> isRooomAvailable(context) async {
    var connectionOk = await isConnectionOk();

    if (connectionOk) {
      try {
        final response =
            await DioService.getMethod(url: MyApiUrl.roomAvailability);
        if (response.statusCode >= 200 || response.statusCode <= 299){
          return RoomAvailabilityResponseModel.fromJson(response.data).isAvailable;
        }
      } on DioError catch (e) {
        if (e.response?.statusCode == 500) {
          ShowMyPopUp.popUpMessenger(context,
              message: "Server Unreachable", type: PopUpType.toast);
          return false;
        }
      } on Exception catch (_) {
        return false;
      }
    } else {
      ShowMyPopUp.popUpMessenger(context,
          message: "No Connection", type: PopUpType.toast);
      return false;
    }

    ShowMyPopUp.popUpMessenger(context,
        message: "Server Unreachable", type: PopUpType.toast);
    return false;
  }
}
