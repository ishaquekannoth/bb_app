import 'dart:io';

import 'package:bb_app/model/sign_in/sign_in_request_model.dart';
import 'package:bb_app/model/sign_in/sign_in_response.dart';
import 'package:bb_app/services/connection_checker.dart';
import 'package:bb_app/services/dio_services.dart';
import 'package:bb_app/utils/Url.dart';
import 'package:dio/dio.dart';

class SignInService {
  Future<SignInResponseModel?> signMeIn(SignInRequestModel data) async {
    final connectionOk = await isConnectionOk();

    if (connectionOk) {
      try {
        final response =
            await DioService.postMethod(url: Url.signIn, value: data.toJson());
        if (response.statusCode >= 200 || response.statusCode <= 299) {
          return SignInResponseModel.fromJson(
              response.data as Map<String, dynamic>);
        }
      } on DioError catch (e) {
        if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
          return SignInResponseModel.fromJson(e.response?.data);
        } else if (e.response?.statusCode == 500) {
          return SignInResponseModel(message: "Internal server Err");
        } else {
          return SignInResponseModel(
              isSuccess: false, message: "Unknown  Err", token: "Invalid");
        }
      } on SocketException catch (e) {
        return SignInResponseModel(message: e.message);
      }
       on FormatException catch(e){
        return SignInResponseModel(message: e.message);
      } 
    } else {
      return SignInResponseModel(
          message: "Oops..No network", isSuccess: false, token: "Invalid");
    }
    return null;
  }
}
