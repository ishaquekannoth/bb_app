import 'package:bb_app/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWithTextCard extends StatelessWidget {
   ImageWithTextCard(
     
      {Key? key, required this.imageUrl, this.hotelName, this.location, this.height,this.width,})
      : super(key: key);

  final String imageUrl;
  final String? hotelName;
  final String? location;
  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          (Container(
            height: height,
            width: width,
            margin: const EdgeInsets.all(8.0),
            child: Center(
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                imageUrl: imageUrl,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    Image.asset("lib/assets/images/NoImage.png"),
              ),
            ),

            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     image: DecorationImage(
            //         image: image ??
            //             Image.asset("lib/assets/images/NoImage.png").image,
            //         fit: BoxFit.cover)),
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
