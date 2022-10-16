import 'package:bb_app/view_model_providers/main_page_navbar_provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainDisplayer extends StatelessWidget {
  const MainDisplayer({super.key});

  @override
  Widget build(BuildContext context) {
    final mainPageController = Provider.of<MainPageViewModel>(context);
    return SafeArea(
      child: Scaffold(
          
          body: mainPageController.currentWidget,
          bottomNavigationBar: CurvedNavigationBar(
            animationCurve: Curves.decelerate,
              height: 50,
              backgroundColor: const Color(0xff8E44AD),
              onTap: (index) => mainPageController.set(index),
              buttonBackgroundColor: Colors.white,
              items: const [
                Icon(
                  Icons.home,
                  size: 25,
                  color: Color(0xff4A235A),
                ),
                Icon(
                  Icons.notes,
                  size: 25,
                  color: Color(0xff4A235A),
                ),
                Icon(
                  Icons.favorite,
                  size: 25,
                  color: Color(0xff4A235A),
                ),
                Icon(
                  Icons.person,
                  size: 25,
                  color: Color(0xff4A235A),
                ),
              ])),
    );
  }
}
