import 'dart:developer';

import 'package:bb_app/model/hotel_model/hotel_model.dart';
import 'package:bb_app/services/connection_checker.dart';
import 'package:bb_app/services/dio_services.dart';
import 'package:bb_app/utils/Url.dart';
import 'package:dio/dio.dart';


class HotelListRequest {
  Future<List<HotelModel>> getHotelList() async {
    final connectionOk = await isConnectionOk();
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
          return [
            HotelModel(
                property:
                    Property(propertyName: "No Data", city: "Not Available"),
                isBlocked: false,
                images: [
                  [Images(url: "")]
                ])
          ];
        } else {
          return [
            HotelModel(
                property:
                    Property(propertyName: "No Data", city: "Not Available"),
                isBlocked: false,
                images: [
                  [Images(url: "")]
                ])
          ];
        }
      } on Exception catch (_) {
        return [
          HotelModel(
              property:
                  Property(propertyName: "No Data", city: "Not Available"),
              isBlocked: false,
              images: [
                [Images(url: "")]
              ])
        ];
      }
    }
    return [
      HotelModel(
          property: Property(propertyName: "No Data", city: "Not Available"),
          isBlocked: false,
          images: [
            [Images(url: "")]
          ])
    ];
  }
}
