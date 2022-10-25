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
          (CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl:hotel==null?"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIIAAACCCAMAAAC93eDPAAAAJ1BMVEXMzMzy8vLd3d3v7+/19fXY2NjJycno6Ojs7OzU1NTk5OTR0dHg4OAimjm/AAAC+klEQVR4nO2Z2XbrIAxFmcHg///eK4khuJnsWE4ers5DmsaraKMJhSrzcymRSCQSiUQikUgkEolEIpFI9EpBFV9+aV75nLTTP2IIYVmjdk5r7X5wnQjmTXRknpTCd81D8NH7tH2nrcU330MASwsFHwWvyUAWJHi7fMk+er/uHl5dWpdAm/dOu/V6NwR1Mw/bT9mrm1FMhqsBavCbeRuhD8ybDhAJfaF1LD3MPTe8r/76PGSIhL/IvCprLz14HcEHFTPZxGTI/MkA5k20lPYIgcGflBHJDx7Lngxz5ffgb57n+qR/SsnA2KOnvkt9z5RA7g83qfoInV8/MJgM/eFJ81B6yU2Nt+bgnf4+mn852SGy1bP1z3QGAf1JspiHAPPIAa9U+U95gRCo8rHtR39YmKbuFMKCHqDOkz7bDaGfy4VR37CU3bfUtgZOI4TY63s/gs9QtWOB8whY3+YIQrGYtKNxMgSiYBaGAwiJTi/dBxYGBDLdf+5YamkHeG9HHAhYVct+BN8aSWZEWNoMdtALhhFBuTqQ782FWHNhPjLPIoTWk3ZXBB7pdozPLAirphlsi2CeT2UwVE8PWQJBM9gWAboFfvScghmhDeQbL2C4464/ZkHAHg0D2YRQpzQI+I6leRDqDDZ7odX+qDyzXouABzb06AkhjgmOghHWuQQuQYAD29kpEOU2ybmE9U9vnziCB4EO7OWGMJxA8rUZIc0jS0wIdGAPBL8ZZ6fZ+uHFClMg4MDWsSOE9HSidum+RpgQKA86gn8x0zt95wguhNwmeVzKPid4lBFcCG3niGDefbEZzYIXQd0Q0hsCbBaF/YyAdWxHKG8JUFNGsHlhdQ1h2fUFE7rmOFS5EHz3wj4ELA3OwY10EAEUmRFoejuG4LRnRai1SEUZ96uwIizNC+rufu+N+BBqUyzhoBRdQvEg0IGtbc4H4gDKOfEhtB599KKnjhI8gShnLr2YrmFX+7G4/kcUNledB7NSJBKJRCKRSCQSiUQikUgk+l/0D9RNHkAd2r7wAAAAAElFTkSuQmCC": hotel!.images!.first.first.url.toString(),
            placeholder: (context, url) =>
                const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                Image.asset("lib/assets/images/NoImage.png"),
          )),
          Positioned(
              bottom: 25,
              left: 35,
              child: Column(
                children: [
                  Text(
                  hotel==null?"":hotel!.property!.propertyName.toString(),
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: KColors.kWhiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                  hotel==null?"":hotel!.property!.city.toString(),
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
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
