import 'package:bb_app/model/hotel_model/hotel_model.dart';
import 'package:bb_app/model/payments/checkout_options.dart';
import 'package:bb_app/utils/push_function.dart';
import 'package:bb_app/utils/routes.dart';
import 'package:bb_app/view/common_widgets/show_snackbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayViewModel extends ChangeNotifier {
  Razorpay razorpay = Razorpay();
  RazorPayViewModel() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handleExternalWallet);
    notifyListeners();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    PushFunctions.pushAndRemoveUntilNamed(Routes.mainDisplayer);
    Fluttertoast.showToast(msg: "Payment Success");
    
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment Failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "External Wallet");
  }

  void makePayment(CheckOutOptions options, context, HotelModel hotel) {
    try {
      razorpay.open(options.toJson());
    } on Exception catch (e) {
      ShowMyPopUp.popUpMessenger(context,
          message: e.toString(), type: PopUpType.toast);
    }
  }
}
