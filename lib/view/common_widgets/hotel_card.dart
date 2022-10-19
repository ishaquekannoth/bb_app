import 'package:bb_app/model/hotel_model/hotel_model.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    this.favourite,
    this.hotel,
    Key? key,
  }) : super(key: key);
  final HotelModel? hotel;
  final void Function()? favourite;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hotel==null?()=>{}:
        Navigator.of(context)
            .pushNamed(Routes.singleHotelDetails, arguments: hotel);
      },
      child: GFListTile(
          avatar: SizedBox(
           height: 100,
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                imageUrl: hotel == null
                    ? ""
                    : hotel!.images!.first.first.url.toString(),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Image.asset("lib/assets/images/NoImage.png"),
              ),
            ),
          ),
          titleText: hotel == null
              ? "Name : Not Available"
              : hotel?.property?.propertyName,
          subTitleText: hotel == null ? "No Data" : hotel?.property?.city,
          icon: IconButton(
              onPressed: favourite, icon: const Icon(Icons.favorite_border))),
    );
  }
}
