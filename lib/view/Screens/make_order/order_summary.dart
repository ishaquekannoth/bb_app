import 'package:bb_app/model/hotel_model/hotel_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final hotelData = ModalRoute.of(context)!.settings.arguments as HotelModel;
    return (Scaffold(
      appBar: AppBar(
        title: const Text("Complete the order Details"),
      ),
      body: Stack(
        children: 
          [SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: size.height * 0.3,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: hotelData.images!.first.first.url!,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Image.asset("lib/assets/images/NoImage.png"),
                    ))
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
