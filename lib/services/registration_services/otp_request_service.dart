import 'dart:io';

import 'package:bb_app/model/otp/otp_request_model.dart';
import 'package:bb_app/model/otp/otp_request_response_model.dart';
import 'package:bb_app/services/connection_checker.dart';
import 'package:bb_app/services/dio_services.dart';
import 'package:bb_app/utils/Url.dart';
import 'package:dio/dio.dart';

class OTPService {
  Future<OTPrequestResponseModel?> otpRequestService(
      OTPrequestModel data) async {
    final connectionOk = await isConnectionOk();
    if (connectionOk) {
      try {
        final otpResponse = await DioService.postMethod(
            url: Url.sendOtpSms, value: data.toJson());
        if (otpResponse.statusCode >= 200 || otpResponse.statusCode! <= 299) {
          return OTPrequestResponseModel.fromJson(
              otpResponse.data as Map<String, dynamic>);
        }
      } on DioError catch (e) {
        if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
          return OTPrequestResponseModel.fromJson(e.response?.data);
        } else if (e.response?.statusCode == 500) {
          return OTPrequestResponseModel(message: e.message);
        } else {
          return OTPrequestResponseModel(message: "Server unreachable");
        }
      } on SocketException catch (e) {
        return OTPrequestResponseModel(message: e.message);
      } on FormatException catch (e) {
       
        return OTPrequestResponseModel(message: e.message);
      }
    } else {
      return OTPrequestResponseModel(message: "Oops..No network");
    }
    return null;
  }
}
