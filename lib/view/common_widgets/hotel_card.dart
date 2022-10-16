import 'package:bb_app/model/hotel_model/hotel_model.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:provider/provider.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    this.favourite,
    required this.hotel,
    Key? key,
  }) : super(key: key);
  final HotelModel hotel;
  final void Function()? favourite;
  @override
  Widget build(BuildContext context) {
  
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(Routes.singleHotelDetails, arguments: hotel),
      child: GFListTile(
          avatar: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              imageUrl: hotel.imageUrl,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Image.asset("lib/assets/images/NoImage.png"),
            ),
          ),
          titleText: hotel.hotelName,
          subTitleText: hotel.hotelLocation,
          description:
              Text(hotel.isBooked == false ? "Available" : "Unavailable"),
          icon: IconButton(
              onPressed: favourite, icon: const Icon(Icons.favorite_border))),
    );
  }
}
