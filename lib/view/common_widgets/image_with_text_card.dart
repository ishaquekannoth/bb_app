import 'package:bb_app/model/hotel_model/hotel_model.dart';
import 'package:bb_app/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWithTextCard extends StatelessWidget {
  const ImageWithTextCard({
    required this.onTap,
    Key? key,
     this.hotel,
    this.height,
    this.width,
  }) : super(key: key);

  final HotelModel? hotel;
  final double? height;
  final double? width;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:hotel==null?()=>{} :onTap,
      child: Stack(
        children: [
          (Container(
            height: height,
            width: width,
            margin: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:hotel==null?"": hotel!.images!.first.first.url.toString(),
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
                  hotel==null?"Not Available":hotel!.property!.propertyName.toString(),
                    style: const TextStyle(
                        color: KColors.kWhiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                  hotel==null?"Un Available":hotel!.property!.city.toString(),
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
