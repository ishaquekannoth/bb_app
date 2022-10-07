class OTPverificationRequestModel {
  final String hash;
  final String otp;

  OTPverificationRequestModel({required this.hash, required this.otp});
    Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['otp'] = otp;
    data['hash'] = hash;
    return data;
  }
}
