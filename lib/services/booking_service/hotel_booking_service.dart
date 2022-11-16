import 'dart:io';
import 'package:bb_app/model/booking/booking_request_model.dart';
import 'package:bb_app/model/booking/booking_response_model.dart';
import 'package:bb_app/services/connection_checker.dart';
import 'package:bb_app/utils/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class HotelBookingService {
  Future<BookingResponseModel?> bookHotel(BookingRequestModel bookingData,FlutterSecureStorage secrets) async {
    final dio = Dio(BaseOptions(baseUrl: MyApiUrl.backendUrl));
    String token =
        await secrets.read(key: "token") as String;
        
    final connectionOk = await isConnectionOk();
    if (connectionOk) {
      try {
        final bookingResponse = await dio.post(MyApiUrl.booking,
            data: bookingData.toJson(),
            options: Options(
              headers: {"Authorization": token},
            ));

        if (bookingResponse.statusCode! >= 200 ||
            bookingResponse.statusCode! <= 299) {
          return BookingResponseModel.fromJson(
              bookingResponse.data as Map<String, dynamic>);
        }
      } on DioError catch (e) {
        if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
          return BookingResponseModel(message: e.message.toString());
        } else if (e.response?.statusCode == 500) {
          return BookingResponseModel(message: e.message.toString());
        } else if (e.type == DioErrorType.sendTimeout ||
            e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return BookingResponseModel(message: "Request timed out");
        } else {
          return BookingResponseModel(
            message: "Server unreachable",
          );
        }
      } on SocketException catch (e) {
        return BookingResponseModel(message: e.message);
      } on FormatException catch (e) {
        return BookingResponseModel(message: e.message);
      } on Exception catch (e) {
        return BookingResponseModel(message: e.toString());
      }
    } else {
      return BookingResponseModel(message: "No internet");
    }
    return null;
  }
}
