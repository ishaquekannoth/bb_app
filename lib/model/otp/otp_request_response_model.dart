class OTPrequestResponseModel {
  bool? isSuccess;
  String? message;
  String? hashKey;
  OTPrequestResponseModel({this.isSuccess, this.hashKey, this.message});

  factory OTPrequestResponseModel.fromJson(Map<String, dynamic> json) {
    return OTPrequestResponseModel(
      isSuccess: json['success']??false,
      message: json['message']??"",
      hashKey: json['hash']??"invalid"
    );
  }
}
