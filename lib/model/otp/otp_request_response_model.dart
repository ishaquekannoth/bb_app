class OTPrequestResponseModel {
  bool? created;
  String? message;
  String? hashKey;
  OTPrequestResponseModel({this.created, this.hashKey, this.message});

  factory OTPrequestResponseModel.fromJson(Map<String, dynamic> json) {
    return OTPrequestResponseModel(
      created: json['created']??false,
      message: json['message']??"",
      hashKey: json['hash']??"invalid"
    );
  }
}
