import 'dart:io';

import 'package:bb_app/model/sign_up/sign_up_request_model.dart';
import 'package:bb_app/model/sign_up/sign_up_response_model.dart';
import 'package:bb_app/services/connection_checker.dart';
import 'package:bb_app/services/dio_services.dart';
import 'package:bb_app/utils/Url.dart';
import 'package:dio/dio.dart';

class SignupService {
  Future<SignUpResponseModel?> signMeUp(SignUpRequestModel data) async {
    final connectionOk = await isConnectionOk();
    if (connectionOk) {
      try {
        final signUpResponse = await DioService.postMethod(
            url: MyApiUrl.signUp, value: data.toJson());
        if (signUpResponse.statusCode >= 200 ||
            signUpResponse.statusCode <= 299) {
          return SignUpResponseModel.fromJson(
              signUpResponse.data as Map<String, dynamic>);
        }
      } on DioError catch (e) {
        if (e.response?.statusCode == 400 || e.response?.statusCode == 500) {
          return SignUpResponseModel.fromJson(e.response?.data);
        } else if (e.type == DioErrorType.sendTimeout ||
            e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return SignUpResponseModel(message: "Request timed out");
        } else {
          return SignUpResponseModel(
              isSuccess: false,
              message: "Server unreachable",
              token: "Invalid");
        }
      } on SocketException catch (e) {
        return SignUpResponseModel(message: e.message);
      } on FormatException catch (e) {
        return SignUpResponseModel(message: e.message);
      } on Exception catch (e) {
        return SignUpResponseModel(message: e.toString());
      }
    } else {
      return SignUpResponseModel(
          message: "Oops..No network", isSuccess: false, token: "Invalid");
    }
    
    return null;
  }
}
