class CheckoutResponse {
  String? razorpayPaymentId;
  String? razorpayOrderId;
  String? razorpaySignature;

  CheckoutResponse(
      {
  this.razorpayPaymentId, this.razorpayOrderId, this.razorpaySignature});
  CheckoutResponse.fromJson(Map<String, dynamic> json) {
    razorpayPaymentId = json['razorpay_payment_id']??"";
    razorpayOrderId = json['razorpay_order_id']??"";
    razorpaySignature = json['razorpay_signature']??"";
  }
}