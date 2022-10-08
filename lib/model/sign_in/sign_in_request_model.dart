class SignInRequestModel {
  final String email;
  final String password;

  SignInRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    // if (email.contains('@')) {
      return {
        "username":email,
        "password":password,
      };
    } 
    // else {   
    //   return {
    //     "phone_number":email,
    //     "password":password,
    //   };
    // }
  }

