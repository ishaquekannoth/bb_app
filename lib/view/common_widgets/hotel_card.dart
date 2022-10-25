import 'package:bb_app/model/hotel_model/hotel_model.dart';
import 'package:bb_app/utils/colors.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:bb_app/view_model_providers/single_hotel_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:provider/provider.dart';

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
    final pageController = Provider.of<SingleHotelViewModel>(context);
    return GestureDetector(
      onTap: hotel == null
          ? () => {}
          : () {
              pageController.onInit();
              Navigator.of(context)
                  .pushNamed(Routes.singleHotelDetails, arguments: hotel);
            },
      child: Card(
        elevation: 15,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: KColors.kThemePurple,
            )),
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
                      ? "https://via.placeholder.com/50"
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
            icon:
                // IconButton(
                //onPressed: favourite, icon: const Icon(Icons.favorite_border))
                Column(
              children: [
                const Text("Price/night"),
                Text(
                  hotel != null ? hotel!.price.toString() : "0",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("${hotel!.category!.category}"),
                Text(
                  hotel?.roomNumbers?.first.isBooked == false
                      ? "Available"
                      : "Unavailable",
                  style:  TextStyle(
                      backgroundColor: hotel?.roomNumbers?.first.isBooked == false
                      ? KColors.kGreenColor
                      : KColors.kRedColor,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            )),
      ),
    );
  }
}
