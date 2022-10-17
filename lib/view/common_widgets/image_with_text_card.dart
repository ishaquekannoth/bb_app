import 'package:bb_app/model/hotel_model/hotel_model.dart';
import 'package:bb_app/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWithTextCard extends StatelessWidget {
  const ImageWithTextCard({
    required this.onTap,
    Key? key,
    required this.hotel,
    this.height,
    this.width,
  }) : super(key: key);

  final HotelModel hotel;
  final double? height;
  final double? width;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          (Container(
            height: height,
            width: width,
            margin: const EdgeInsets.all(8.0),
            child: Center(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: hotel.images?.first.first.url??"https://assets.vogue.in/photos/5ce3f37b0c1a9010b7c795e6/2:3/w_1600,c_limit/Mehandi-artist-featured.jpg",
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
              left: 35,
              child: Column(
                children: [
                  Text(
                    hotel.property?.propertyName??"No data",
                    style: const TextStyle(
                        color: KColors.kWhiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    hotel.property?.city??"No data",
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
