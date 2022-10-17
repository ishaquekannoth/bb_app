import 'package:bb_app/model/hotel_model/hotel_model.dart';
import 'package:bb_app/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';

class SingleHotelDetailsScreen extends StatelessWidget {
  const SingleHotelDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hotel = ModalRoute.of(context)?.settings.arguments as HotelModel;
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(top: 20),
                //  foregroundDecoration:
                // const BoxDecoration(color: Colors.black26),
                child: SizedBox(
                    height: size.height * 0.4,
                    child: GFCarousel(
                      autoPlay: true,
                      enlargeMainPage: true,
                      viewportFraction: 0.5,
                      height: size.height * 0.25,
                      items: hotel.images!.first.map((url) {
                        return Container(
                            margin: const EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: url.url.toString(),
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Image.asset("lib/assets/images/NoImage.png"),
                            ));
                      }).toList(),
                    ))),

            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: size.height * .3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        hotel.property?.propertyName ?? "No Data",
                        style: const TextStyle(
                            color: KColors.kBlackColor,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: const Text(
                          "8.4/85 reviews",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.purple,
                        ),
                        onPressed: () {
                          // hotelData.toggleFavourite();
                        },
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(32.0),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: const <Widget>[
                                      Icon(
                                        Icons.star,
                                        color: Colors.purple,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.purple,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.purple,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.purple,
                                      ),
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.purple,
                                      ),
                                    ],
                                  ),
                                  Text.rich(
                                    TextSpan(children: [
                                      const WidgetSpan(
                                          child: Icon(
                                        Icons.location_on,
                                        size: 16.0,
                                        color: Colors.grey,
                                      )),
                                      TextSpan(
                                          text: "8 km ${hotel.property?.city}")
                                    ]),
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12.0),
                                  )
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "\u{20B9} ${hotel.price}",
                                  style: const TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                const Text(
                                  "per night",
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.black),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 30.0),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 32)),
                            onPressed: () {},
                            child: const Text(
                              "Book Now",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Text(
                          "Description".toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14.0),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          hotel.property?.propertyDetails ?? '',
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14.0),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14.0),
                        ),
                        const Text(
                          "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                // title: const Text(
                //   "DETAIL",
                //   style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                // ),
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomLeft,
            //   child: BottomNavigationBar(
            //     backgroundColor: Colors.white54,
            //     elevation: 0,
            //     selectedItemColor: Colors.black,
            //     items: [
            //       BottomNavigationBarItem(
            //           icon: Icon(Icons.search), title: Text("Search")),
            //       BottomNavigationBarItem(
            //           icon: Icon(Icons.favorite_border),
            //           title: Text("Favorites")),
            //       BottomNavigationBarItem(
            //           icon: Icon(Icons.settings), title: Text("Settings")),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
