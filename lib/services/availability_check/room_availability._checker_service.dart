import 'package:bb_app/model/room_availability/room_availability_model.dart';
import 'package:bb_app/services/connection_checker.dart';
import 'package:bb_app/services/dio_services.dart';
import 'package:bb_app/utils/url.dart';
import 'package:dio/dio.dart';

import '../../view/common_widgets/show_snackbar_widget.dart';

class RoomAvailabilityService {
  Future<bool?> isRooomAvailable(
      RoomAvailabiltyRequestModel roomData, context) async {
    var connectionOk = await isConnectionOk();

    if (connectionOk) {
      try {
        final response = await DioService.postMethod(
            url: MyApiUrl.roomAvailability, value: roomData.toJson());
        if (response.statusCode >= 200 || response.statusCode <= 299) {
          ShowMyPopUp.popUpMessenger(context,
              message: RoomAvailabilityResponseModel.fromJson(response.data)
                      .isAvailable
                  ? "Rooms Are Available for the selected Date and Count"
                  : "No Rooms available..Try changing dates or reducing Rooms Count",
              type: PopUpType.toast);
          return RoomAvailabilityResponseModel.fromJson(response.data)
              .isAvailable;
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
          message: "No connection!!", type: PopUpType.toast);
      return false;
    }
    return null;
  }
}
