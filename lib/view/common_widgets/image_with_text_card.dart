import 'package:bb_app/utils/colors.dart';
import 'package:flutter/material.dart';

class ImageWithTextCard extends StatelessWidget {
  const ImageWithTextCard({Key? key, this.image, this.hotelName, this.location})
      : super(key: key);

  final ImageProvider? image;
  final String? hotelName;
  final String? location;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          (Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: image ??
                        Image.asset("lib/assets/images/NoImage.png").image,
                    fit: BoxFit.cover)),
          )),
          Positioned(
              bottom: 25,
              left: 25,
              child: Column(
                children: [
                  Text(
                    hotelName ?? "Unavailable",
                    style: const TextStyle(
                        color: KColors.kWhiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    location ?? "Unavailable",
                    style: const TextStyle(
                        color: KColors.kWhiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
