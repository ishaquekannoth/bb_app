import 'package:bb_app/utils/image_constants.dart';
import 'package:bb_app/view/common_widgets/custom_text_headings.dart';
import 'package:bb_app/view/common_widgets/image_with_text_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: size.height * 0.07,
              margin: const EdgeInsets.only(top: 20),
              width: size.width * 0.99,
              child: const CupertinoSearchTextField(
                backgroundColor: Colors.white,
              )),
          const HeadingText(
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
                  imageUrl: url,
                  // Uri.parse(url).hasAbsolutePath ? NetworkImage(url) : null,
                  hotelName: "Andi aapeees",
                  location: "kundara",
                );
              }).toList()),
          const HeadingText(
            text: "Explore Everything Nearby",
            padding: EdgeInsets.only(left: 10, top: 20),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return GFListTile(
                  avatar: GFAvatar(
                    backgroundImage: NetworkImage(bridalImage),
                    size: GFSize.LARGE,
                    shape: GFAvatarShape.square,
                  ),
                  titleText: 'Hotel Name',
                  subTitleText: 'Simple Description',
                  icon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border)));
            },
          )
        ],
      ),
    );
  }
}
