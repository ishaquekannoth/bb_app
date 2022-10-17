import 'package:bb_app/view/common_widgets/custom_text_headings.dart';
import 'package:flutter/material.dart';

class MyBookings extends StatelessWidget {
  const MyBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Card(
        elevation: 5,
        child: Container(
          height: size.height * 0.35,
          margin: const EdgeInsets.only(top: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    // color: Colors.amber,
                    width: size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        HeadingText(
                            text: "Booking ID", padding: EdgeInsets.zero),
                        HeadingText(
                            text: "Hotel Name:", padding: EdgeInsets.zero),
                        HeadingText(
                            text: "Hotel Location:", padding: EdgeInsets.zero),
                        HeadingText(
                            text: "Date of stay", padding: EdgeInsets.zero),
                        HeadingText(
                            text: "Check in time:", padding: EdgeInsets.zero),
                        HeadingText(
                            text: "Payment Status:", padding: EdgeInsets.zero),
                      ],
                    ),
                  ),
                  SizedBox(
                    // color: Colors.red,
                    width: size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        HeadingText(
                          text: "Booking ID",
                          padding: EdgeInsets.zero,
                        ),
                        HeadingText(
                            text: "Hotel Name:", padding: EdgeInsets.zero),
                        HeadingText(
                            text: "Hotel Location:", padding: EdgeInsets.zero),
                        HeadingText(
                            text: "Date of stay", padding: EdgeInsets.zero),
                        HeadingText(
                            text: "Check in time:", padding: EdgeInsets.zero),
                        HeadingText(
                            text: "Payment Status:", padding: EdgeInsets.zero),
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Cancel the Booking"))
            ],
          ),
        ),
      ),
    );
  }
}
