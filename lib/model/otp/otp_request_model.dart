class OTPrequestModel {
  String phoneNumber;
  OTPrequestModel({required this.phoneNumber});

  Map<String, dynamic> toJson() {
    return {
      "phone_number":phoneNumber
    };
  }
}
