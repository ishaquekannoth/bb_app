import 'package:bb_app/view/Screens/favourites/booking_history.dart';
import 'package:bb_app/view/Screens/home_screen/homescreen.dart';
import 'package:bb_app/view/Screens/my_order/orders_screen.dart';
import 'package:bb_app/view/Screens/profile/profile.dart';
import 'package:flutter/cupertino.dart';

class MainPageViewModel extends ChangeNotifier {
  int selectedIndex = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const MyBookings(),
    const FavouritesScreen(),
    const ProfileScreen()
  ];

  set setWidget(int index) {
    if (index != selectedIndex) {
      selectedIndex = index;
      notifyListeners();
    }
  }

  Widget get currentWidget => pages[selectedIndex];
  set setIndex(index) {
    selectedIndex = index;
  }
}
