import 'package:bb_app/utils/colors.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:bb_app/view/common_widgets/custom_text_headings.dart';
import 'package:bb_app/view/common_widgets/hotel_card.dart';
import 'package:bb_app/view/common_widgets/image_with_text_card.dart';
import 'package:bb_app/view_model_providers/hotel_list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final hotelListProvider = Provider.of<HotelListViewModel>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: size.height * 0.07,
              margin: const EdgeInsets.only(top: 20),
              width: size.width * 0.99,
              child: const CupertinoSearchTextField(
                backgroundColor: Colors.white,
              )),
          const HeadingText(
            text: 'Featuring the popular Hotels',
          ),
          GFCarousel(
              pauseAutoPlayOnTouch: const Duration(seconds: 3),
              autoPlay: true,
              enlargeMainPage: true,
              viewportFraction: 0.5,
              height: size.height * 0.2,
              items: hotelListProvider.hotelList.isEmpty
                  ? [
                      ImageWithTextCard(
                        hotel: null,
                        onTap: () => {},
                      )
                    ]
                  : hotelListProvider.hotelList.map((singleHotel) {
                      return ImageWithTextCard(
                        hotel: singleHotel,
                        onTap: () => Navigator.of(context).pushNamed(
                            Routes.singleHotelDetails,
                            arguments: singleHotel),
                      );
                    }).toList()),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Explore Everything Nearby",
                style: TextStyle(
                    color: KColors.kBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              DropdownButton<SortType>(
                isDense: true,
                alignment: AlignmentDirectional.center,
                icon: const Icon(Icons.sort),
                elevation: 10,
                itemHeight: kMinInteractiveDimension,
                items: const [
                  DropdownMenuItem(
                    value: SortType.lowToHigh,
                    child: Text(
                      "Price: Low to high",
                      style: TextStyle(
                          color: KColors.kBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  DropdownMenuItem(
                    value: SortType.highToLow,
                    child: Text(
                      "Price: High to low",
                      style: TextStyle(
                          color: KColors.kBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  DropdownMenuItem(
                    value: SortType.sortByVicinity,
                    child: Text(
                      "Vicinity",
                      style: TextStyle(
                          color: KColors.kBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  )
                ],
                onChanged: (value) =>
                    hotelListProvider.sortHotelTypeSetter(value!, context),
                value: hotelListProvider.sortType,
              ),
            ],
          ),
          hotelListProvider.isConnectionOk == false ||
                  hotelListProvider.isConnectionOk == null ||
                  hotelListProvider.hotelList.isEmpty
              ? ElevatedButton(
                  onPressed: () {
                    hotelListProvider.fetchAllHotels(context);
                  },
                  child: InternetConnectionChecker().isActivelyChecking
                      ? const CircularProgressIndicator()
                      : const Text("Refresh"))
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: hotelListProvider.hotelList.isEmpty
                      ? 1
                      : hotelListProvider.hotelList.length,
                  itemBuilder: (context, index) {
                    return HotelCard(
                        hotel: hotelListProvider.hotelList.isNotEmpty
                            ? hotelListProvider.hotelList[index]
                            : null);
                  },
                ),
        ],
      ),
    );
  }
}
