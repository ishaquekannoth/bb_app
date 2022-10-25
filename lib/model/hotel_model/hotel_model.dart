import 'dart:convert';

// class HotelModel extends ChangeNotifier {
//   final String hotelId;
//   final String hotelName;
//   final String imageUrl;
//   final String hotelLocation;
//   bool? isBooked;
//   bool? isFavourite;

//   HotelModel(
//       {required this.hotelId,
//       required this.hotelName,
//       required this.hotelLocation,
//       required this.imageUrl,
//       this.isFavourite = false,
//       this.isBooked});

//   toggleFavourite() {
//     isFavourite = !isFavourite!;
//     notifyListeners();
//   }
// }

// To parse this JSON data, do
//
//     final roomsModel = roomsModelFromJson(jsonString);

List<HotelModel> hotelModelFromJson(String str) =>
    List<HotelModel>.from(json.decode(str).map((x) => HotelModel.fromJson(x)));

class HotelModel {
  HotelModel({
    this.id,
    this.property,
    this.category,
    this.vendor,
    this.amenities,
    this.roomName,
    this.roomType,
    this.quantity,
    this.view,
    this.isBlocked,
    this.bathroom,
    this.price,
    this.guest,
    this.noOfBed,
    this.checkinTime,
    this.checkoutTime,
    this.images,
    this.roomNumbers,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  Property? property;
  Category? category;
  String? vendor;
  List<dynamic>? amenities;
  String? roomName;
  String? roomType;
  int? quantity;
  String? view;
  bool? isBlocked;
  String? bathroom;
  int? price;
  int? guest;
  int? noOfBed;
  String? checkinTime;
  String? checkoutTime;
  List<List<Images>>? images;
  List<RoomNumber>? roomNumbers;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
        id: json["_id"] ?? "No Data",
        property: Property.fromJson(json["property"]),
        category: Category.fromJson(json["category"]),
        vendor: json["vendor"] ?? "No Data",
        amenities: List<dynamic>.from(json["amenities"].map((x) => x)),
        roomName: json["room_name"] ?? "No Data",
        roomType: json["room_type"] ?? "No Data",
        quantity: json["quantity"] ?? 0,
        view: json["view"] ?? "No Data",
        isBlocked: json["isBlocked"] ?? "No Data",
        bathroom: json["bathroom"] ?? "No Data",
        price: json["price"] ?? "0",
        guest: json["guest"] ?? "No Data",
        noOfBed: json["no_of_bed"] ?? "No Data",
        checkinTime: json["checkin_time"] ?? "12 AM",
        checkoutTime: json["checkout_time"] ?? "11 AM",
        images: List<List<Images>>.from(json["images"]
            .map((x) => List<Images>.from(x.map((x) => Images.fromJson(x))))),
        roomNumbers: List<RoomNumber>.from(json["roomNumbers"].map((x) => RoomNumber.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"] ?? "No Data",
      );
}

class Category {
  Category({
    this.id,
    this.category,
    this.description,
    this.subCategory,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? category;
  String? description;
  List<dynamic>? subCategory;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"] ?? "No Data",
        category: json["category"] ?? "No Data",
        description: json["description"] ?? "No Data",
        subCategory: List<dynamic>.from(json["sub_category"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}

class Images {
  Images({
    this.url,
  });

  String? url;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        url: json["url"],
      );
}

class Property {
  Property({
    this.id,
    this.propertyName,
    this.phoneNumber,
    this.propertyDetails,
    this.email,
    this.category,
    this.vendor,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.address,
    this.city,
    this.country,
    this.landmark,
    this.pincode,
    this.state,
    this.street,
  });

  String? id;
  String? propertyName;
  int? phoneNumber;
  String? propertyDetails;
  String? email;
  String? category;
  String? vendor;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? address;
  String? city;
  String? country;
  String? landmark;
  int? pincode;
  String? state;
  String? street;

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json["_id"] ?? "No Data",
        propertyName: json["property_name"] ?? "No Data",
        phoneNumber: json["phone_number"] ?? "No Data",
        propertyDetails: json["property_details"] ?? "No Data",
        email: json["email"] ?? "No Data",
        category: json["category"] ?? "No Data",
        vendor: json["vendor"] ?? "No Data",
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        address: json["address"] ?? "No Data",
        city: json["city"] ?? "No Data",
        country: json["country"] ?? "No Data",
        landmark: json["landmark"] ?? "No Data",
        pincode: json["pincode"] ?? "No Data",
        state: json["state"] ?? "No Data",
        street: json["street"] ?? "No Data",
      );
}

class RoomNumber {
  RoomNumber({
    this.number,
    this.isBooked,
    this.unavailableDates,
    this.id,
  });

  String? number;
  bool? isBooked;
  List<dynamic>? unavailableDates;
  String? id;

  factory RoomNumber.fromJson(Map<String, dynamic> json) => RoomNumber(
        number: json["number"] ?? "No Data",
        isBooked: json["isBooked"] ?? false,
        unavailableDates:
            List<dynamic>.from(json["unavailableDates"] ?? [].map((x) => x)),
        id: json["_id"] ?? "No Data",
      );
}
