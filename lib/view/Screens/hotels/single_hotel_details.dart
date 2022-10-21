import 'package:bb_app/model/hotel_model/hotel_model.dart';
import 'package:bb_app/utils/colors.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:bb_app/view/common_widgets/custom_text_headings.dart';
import 'package:bb_app/view_model_providers/single_hotel_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SingleHotelDetailsScreen extends StatelessWidget {
  const SingleHotelDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hotel = ModalRoute.of(context)?.settings.arguments as HotelModel;
    final size = MediaQuery.of(context).size;
    final pageController = Provider.of<SingleHotelViewModel>(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
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
                      SizedBox(
                        width: size.width * 0.5,
                        child: Text(
                          hotel.property?.propertyName ?? "No Data",
                          style: const TextStyle(
                              color: KColors.kBlackColor,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold),
                        ),
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
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(children: [
                                      const WidgetSpan(
                                          child: Icon(
                                        Icons.location_on,
                                        size: 16.0,
                                        color: Colors.grey,
                                      )),
                                      TextSpan(
                                          text:
                                              "Type : ${hotel.category?.category}",
                                          style: const TextStyle(
                                              color: Colors.black)),
                                    ]),
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12.0),
                                  ),
                                  SizedBox(
                                      width: size.width * 0.3,
                                      child: Row(
                                        children: [
                                          const FaIcon(
                                            FontAwesomeIcons.phone,
                                            color: KColors.kThemePurple,
                                            size: 12,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(hotel.property!.phoneNumber
                                              .toString()),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "\u{20B9} ${hotel.price}",
                                  style: const TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                const Text(
                                  "per day",
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.black),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 30.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            HeadingText(
                                width: 80,
                                text: "Check in ${hotel.checkinTime}",
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.zero),
                            HeadingText(
                                width: 100,
                                text: "Check Out ${hotel.checkoutTime}",
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.zero),
                            const HeadingText(
                                width: 100,
                                text: "No of Guests",
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.zero),
                            DropdownButton<int>(
                              elevation: 10,
                              itemHeight: kMinInteractiveDimension,
                              items: const [
                                DropdownMenuItem(
                                  value: 0,
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        color: KColors.kBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                        color: KColors.kBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text(
                                    "3",
                                    style: TextStyle(
                                        color: KColors.kBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                )
                              ],
                              onChanged: (value) =>
                                  pageController.onSelectGuests(value ?? 0),
                              value: pageController.guests,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30.0),
                        SizedBox(
                            width: size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const HeadingText(
                                  text: "Amenities available\n",
                                  padding: EdgeInsets.zero,
                                ),
                                Row(
                                  children: const [
                                    FaIcon(
                                      FontAwesomeIcons.wifi,
                                      color: KColors.kThemePurple,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.squareParking,
                                      color: KColors.kThemePurple,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.wheelchair,
                                      color: KColors.kThemePurple,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.personSwimming,
                                      color: KColors.kThemePurple,
                                    )
                                  ],
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    HeadingText(
                                      margin: EdgeInsets.zero,
                                      width: size.width * 0.3,
                                      text: "Check in Date:",
                                      padding: const EdgeInsets.only(left: 10),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          pageController
                                              .onDateSelector(context);
                                        },
                                        child: Text(DateFormat('dd / MM / yy')
                                            .format(pageController
                                                .pickedDate!.start)))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    HeadingText(
                                      margin: EdgeInsets.zero,
                                      width: size.width * 0.3,
                                      text: "Check out Date:",
                                      padding: const EdgeInsets.only(left: 10),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          pageController
                                              .onDateSelector(context);
                                        },
                                        child: Text(DateFormat('dd / MM / yy')
                                            .format(pageController
                                                .pickedDate!.end)))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 32)),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  Routes.orderSummaryScreen,
                                  arguments: hotel);
                            },
                            child: const Text(
                              "Book Now",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
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
