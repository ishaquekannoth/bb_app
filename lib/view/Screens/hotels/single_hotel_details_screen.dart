import 'package:bb_app/model/hotel_model/hotel_model.dart';
import 'package:bb_app/utils/colors.dart';
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
                decoration: const BoxDecoration(
                  color: KColors.kThemePurple,
                ),
                padding: const EdgeInsets.only(top: 20),
                //  foregroundDecoration:
                // const BoxDecoration(color: Colors.black26),
                child: SizedBox(
                    height: size.height * 0.5,
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * .3),
                  Container(
                    padding: const EdgeInsets.only(left: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.5,
                          child: Text(
                            hotel.property?.propertyName ?? "No Data",
                            style: const TextStyle(
                                color: KColors.kWhiteColor,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
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
                                  SizedBox(
                                      width: size.width * 0.7,
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
                                          Text(
                                            " ${hotel.property!.phoneNumber}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                  SizedBox(
                                      width: size.width * 0.5,
                                      child: Text(
                                        "${hotel.property?.address}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
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
                        SizedBox(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const HeadingText(
                              text: "Amenities available\n",
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.zero,
                            ),
                            Container(
                              height: size.height * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.black)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  FaIcon(
                                    FontAwesomeIcons.wifi,
                                    color: KColors.kThemePurple,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.squareParking,
                                    color: KColors.kThemePurple,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.wheelchair,
                                    color: KColors.kThemePurple,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.personSwimming,
                                    color: KColors.kThemePurple,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            HeadingText(
                                width: 80,
                                text: "Check in\n ${hotel.checkinTime}",
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.zero),
                            HeadingText(
                                width: 100,
                                text: "Check Out\n${hotel.checkoutTime}",
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.zero),
                            const HeadingText(
                                width: 100,
                                text: "No of Rooms",
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.zero),
                            DropdownButton<int>(
                              menuMaxHeight: 80,
                              elevation: 10,
                              itemHeight: kMinInteractiveDimension,
                              items: List.generate(
                                  5,
                                  (index) => customDropDown(
                                      dispalyValue: "${index + 1}",
                                      value: index)),
                              onChanged: (value) =>
                                  pageController.onSelectGuests(
                                      rooms: value!,
                                      hotelId: hotel.id.toString(),
                                      context: context),
                              value: pageController.totalRooms,
                            ),
                          ],
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black)),
                            width: size.width * 0.6,
                            child: HeadingText(
                                margin: EdgeInsets.zero,
                                padding: EdgeInsets.zero,
                                text:
                                    "Max Guests Per Room is strictly  ${hotel.guest} "),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              pageController.isActivelyChecking
                                  ? SizedBox(
                                      height: 20,
                                      width: size.width * 0.6,
                                      child: Row(
                                        children: const [
                                          Text("Checking Availability"),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          SizedBox(
                                              height: 20,
                                              width: 20,
                                              child:
                                                  CircularProgressIndicator()),
                                        ],
                                      ))
                                  : const Text(
                                      " Room Availability Indicator ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                              CircleAvatar(
                                backgroundColor:
                                    pageController.roomAvailability == true
                                        ? Colors.green
                                        : Colors.red,
                                radius: 30,
                              ),
                            ],
                          ),
                        ),
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
                                          pageController.onDateSelector(
                                              hotelId: hotel.id.toString(),
                                              context: context);
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
                                          pageController.onDateSelector(
                                              hotelId: hotel.id.toString(),
                                              context: context);
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
                          child: pageController.roomAvailability
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 32)),
                                  onPressed: () {},
                                  child: const Text(
                                    "Book Now",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              : Container(
                                  height: size.height * 0.07,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.white)),
                                  child: const Center(
                                    child: Text(
                                      "Try Another Date or with lesser rooms count",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: KColors.kWhiteColor,
                                          fontWeight: FontWeight.bold),
                                    ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DropdownMenuItem<Type> customDropDown<Type>(
    {required String dispalyValue, required Type value, double? fontSize}) {
  return DropdownMenuItem<Type>(
    value: value,
    child: Text(
      dispalyValue,
      style: TextStyle(
          color: KColors.kBlackColor,
          fontWeight: FontWeight.bold,
          fontSize: fontSize ?? 14),
    ),
  );
}
