class CheckOutOptions {
  CheckOutOptions(
      {required this.key,
      required this.currency,
      required this.amount,
      required this.companyName,
      required this.orderId,
      this.description = "",
      this.notes = "",
      this.timeout = 180,
      this.customerId = "",
      this.prefill});

  String key;
  String currency;
  int amount;
  String? notes;
  String companyName;
  String orderId;
  String? description;
  int? timeout;
  Prefill? prefill;
  String customerId;

  Map<String, dynamic> toJson() => {
        "key": key,
        "currency": currency,
        "amount": amount,
        "notes": notes,
        "name": companyName,
        "order_id": orderId,
        "description": description,
        "timeout": timeout,
        "prefill": prefill?.toJson(),
        "customer_id": customerId,
      };
}

class Prefill {
  Prefill({
    this.contact = "",
    this.email = "",
  });

  String? contact;
  String? email;

  Map<String, dynamic> toJson() => {
        "contact": contact??"",
        "email": email??"",
      };
}
