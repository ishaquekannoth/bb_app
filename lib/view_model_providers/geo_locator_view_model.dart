import 'package:bb_app/services/connection_checker.dart';
import 'package:bb_app/utils/colors.dart';
import 'package:bb_app/utils/geo_locations_service.dart';
import 'package:bb_app/view/common_widgets/show_snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocatorViewModel extends ChangeNotifier {
  Placemark currentLocation = Placemark();
  bool isLoading = false;
  GeoLocatorViewModel(context) {
    getLocationData(context);
  }

  getLocationData(context) async {
    final connectionOk = await isConnectionOk();

    if (connectionOk) {
      try {
        isLoadingToggler();

        // currentLocation = Placemark();
        final data = await  determinePosition().onError((error, stackTrace) {
          isLoadingToggler();
          if (error.toString() ==
              "GPS is disabled! change it in the settings") {
            showDialog(
                context: context,
                builder: (context) {
                  return (MyAlertDialogue(
                      onTap: () => Geolocator.openLocationSettings()
                          .then((value) => Navigator.of(context).pop()),
                      alertTitle: "Enable GPS?"));
                });
          }
          if (error.toString() ==
              "Location Access denied!! Change in App settings") {
            showDialog(
                context: context,
                builder: (context) {
                  return (MyAlertDialogue(
                      onTap: () => Geolocator.openAppSettings()
                          .then((value) => Navigator.of(context).pop()),
                      alertTitle: "Open App Settings?"));
                });
          }
          return ShowMyPopUp.popUpMessenger(context,
              message: error.toString(),
              type: PopUpType.toast,
              toastColor: KColors.kBlackColor);
        });
        List<Placemark> places =
            await placemarkFromCoordinates(data.latitude, data.longitude);

        currentLocation = places.first;
        isLoadingToggler();
      } on PlatformException {
        isLoadingToggler();
      } on Exception {
        isLoadingToggler();
      }
    } else {
      ShowMyPopUp.popUpMessenger(context,
          message: "No internet", type: PopUpType.toast);
    }
  }

  isLoadingToggler() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
