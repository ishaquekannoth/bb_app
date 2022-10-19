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
          (FittedBox(
            child: CachedNetworkImage(
              fit: BoxFit.contain,
              imageUrl:hotel==null?"https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg": hotel!.images!.first.first.url.toString(),
              placeholder: (context, url) =>
                  const CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  Image.asset("lib/assets/images/NoImage.png"),
            ),
          )),
          Positioned(
              bottom: 25,
              left: 35,
              child: Column(
                children: [
                  Text(
                  hotel==null?"No Data":hotel!.property!.propertyName.toString(),
                    style: const TextStyle(
                        color: KColors.kWhiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                  hotel==null?"Available":hotel!.property!.city.toString(),
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
