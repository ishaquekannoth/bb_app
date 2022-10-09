class OTPverificationRequestModel {
  final String hashkey;
  final String otp;

  OTPverificationRequestModel({required this.hashkey, required this.otp});
    Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['otp'] = otp;
    data['hash'] = hashkey;
    return data;
  }
}
