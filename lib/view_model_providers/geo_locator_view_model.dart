import 'package:bb_app/utils/colors.dart';
import 'package:bb_app/utils/geo_locations_service.dart';
import 'package:bb_app/view/common_widgets/show_snackbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';

class GeoLocatorViewModel extends ChangeNotifier {
  Placemark currentLocation = Placemark();

  GeoLocatorViewModel(context) {
    getLocationData(context);
  }
  getLocationData(context) async {
    final data = await determinePosition().onError((error, stackTrace) =>
        ShowMyPopUp.popUpMessenger(context,
            message: error.toString(),
            type: PopUpType.toast,
            toastColor: KColors.kRedColor));

    List<Placemark> places =
        await placemarkFromCoordinates(data.latitude, data.longitude);

    currentLocation = places.first;
    notifyListeners();
  }
}
