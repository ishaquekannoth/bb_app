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
    try {
      isLoadingToggler();
      // currentLocation = Placemark();
      var data = await determinePosition().onError((error, stackTrace) {
        isLoadingToggler();
        return ShowMyPopUp.popUpMessenger(context,
            message: error.toString(),
            type: PopUpType.toast,
            toastColor: KColors.kRedColor);
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
  }

  isLoadingToggler() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
