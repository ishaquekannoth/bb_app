import 'dart:io';

import 'package:bb_app/model/otp/otp_request_model.dart';
import 'package:bb_app/model/otp/otp_request_response_model.dart';
import 'package:bb_app/model/otp/otp_verification_request_model.dart';
import 'package:bb_app/model/otp/otp_verification_response_model.dart';
import 'package:bb_app/services/connection_checker.dart';
import 'package:bb_app/services/dio_services.dart';
import 'package:bb_app/utils/url.dart';
import 'package:dio/dio.dart';

class OTPService {
  Future<OTPrequestResponseModel?> otpRequestService(
      OTPrequestModel data) async {
    final connectionOk = await isConnectionOk();
    if (connectionOk) {
      try {
        final otpResponse = await DioService.postMethod(
            url: MyApiUrl.sendOtpSms, value: data.toJson());
        if (otpResponse.statusCode >= 200 || otpResponse.statusCode! <= 299) {
          return OTPrequestResponseModel.fromJson(
              otpResponse.data as Map<String, dynamic>);
        }
      } on DioError catch (e) {
        if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
          return OTPrequestResponseModel.fromJson(e.response?.data);
        } else if (e.response?.statusCode == 500) {
          return OTPrequestResponseModel(message: e.message);
        } else if (e.type == DioErrorType.sendTimeout ||
            e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return OTPrequestResponseModel(message: "Request timed out");
        } else {
          return OTPrequestResponseModel(message: "Server unreachable");
        }
      } on SocketException catch (e) {
        return OTPrequestResponseModel(message: e.message);
      } on FormatException catch (e) {
        return OTPrequestResponseModel(message: e.message);
      } on Exception catch (e) {
        return OTPrequestResponseModel(message: e.toString());
      }
    } else {
      return OTPrequestResponseModel(message: "Oops..No network");
    }
    return null;
  }

  Future<OTPverificationResponseModel?> otpVerificationService(
      OTPverificationRequestModel data) async {
    final connectionOk = await isConnectionOk();
    if (connectionOk) {
      try {
        final otpVerificationResponse = await DioService.postMethod(
            url: MyApiUrl.verifyOtp, value: data.toJson());
        if (otpVerificationResponse.statusCode >= 200 ||
            otpVerificationResponse.statusCode! <= 299) {
          return OTPverificationResponseModel.fromJson(
              otpVerificationResponse.data as Map<String, dynamic>);
        }
      } on DioError catch (e) {
        if (e.response?.statusCode == 400) {
          return OTPverificationResponseModel.fromJson(e.response?.data);
        } else if (e.response?.statusCode == 500) {
          return OTPverificationResponseModel(message: e.message);
        } 
        else if (e.type == DioErrorType.sendTimeout ||
            e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return OTPverificationResponseModel(message: "Request timed out");
        }
        
        else {
          return OTPverificationResponseModel(message: "Server unreachable");
        }
      } on SocketException catch (e) {
        return OTPverificationResponseModel(message: e.message);
      } on FormatException catch (e) {
        return OTPverificationResponseModel(message: e.message);
      }
    } else {
      return OTPverificationResponseModel(message: "Oops..Connection Lost !!");
    }
    return null;
  }
}
