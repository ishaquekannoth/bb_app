import 'package:bb_app/utils/colors.dart';
import 'package:bb_app/utils/image_constants.dart';
import 'package:bb_app/view/common_widgets/custom_text_headings.dart';
import 'package:bb_app/view/common_widgets/image_with_text_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/single_child_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          // AppBar(
          //   title: const Text("Home"),

          //   elevation: 10,
          //   centerTitle: true,
          //   actions: const [
          //     Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 8.0),
          //       child: CircleAvatar(
          //           radius: 18, backgroundColor: KColors.kWhiteColor),
          //     )
          //   ],
          // ),
          Container(
              height: size.height * 0.07,
              margin: const EdgeInsets.only(top: 20),
              width: size.width * 0.99,
              child: const CupertinoSearchTextField(
                backgroundColor: Colors.white,
              )),
          HeadingText(
            text: 'Featuring the popular Hotels',
          ),
          GFCarousel(
              pauseAutoPlayOnTouch: const Duration(seconds: 3),
              autoPlay: true,
              enlargeMainPage: true,
              viewportFraction: 0.5,
              height: size.height * 0.2,
              items: imageList.map((url) {
                return ImageWithTextCard(
                  image:
                      Uri.parse(url).hasAbsolutePath ? NetworkImage(url) : null,
                  hotelName: "Andi aapeees",
                  location: "kundara",
                );
              }).toList()),
          HeadingText(
            text: "Explore Everything Nearby",
            padding: const EdgeInsets.only(left: 10, top: 20),
          ),
          GFListTile(
              avatar: const GFAvatar(
                size: GFSize.LARGE,
                shape: GFAvatarShape.square,
              ),
              titleText: 'Hotel Name',
              subTitleText: 'Simple Description',
              icon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_border))),
          GFListTile(
              avatar: const GFAvatar(
                size: GFSize.LARGE,
                shape: GFAvatarShape.square,
              ),
              titleText: 'Hotel Name',
              subTitleText: 'Simple Description',
              icon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_border))),
          GFListTile(
              avatar: const GFAvatar(
                size: GFSize.LARGE,
                shape: GFAvatarShape.square,
              ),
              titleText: 'Hotel Name',
              subTitleText: 'Simple Description',
              icon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_border))),

          GFListTile(
              avatar: const GFAvatar(
                size: GFSize.LARGE,
                shape: GFAvatarShape.square,
              ),
              titleText: 'Hotel Name',
              subTitleText: 'Simple Description',
              icon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_border))),
          GFListTile(
              avatar: const GFAvatar(
                size: GFSize.LARGE,
                shape: GFAvatarShape.square,
              ),
              titleText: 'Hotel Name',
              subTitleText: 'Simple Description',
              icon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite))),
        ],
      ),
    );
  }
}
