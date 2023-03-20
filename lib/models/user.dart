class AppUser {
  String? uid;
  String? name;
  String? gender;
  String? phoneNumber;
  String? email;
  String? city;
  String? userPassword;
  String? address;
  List<CartItems>? cart;

  AppUser();

  AppUser.inituser(this.name, this.email, this.gender, this.address,
      this.phoneNumber, this.userPassword, this.uid);

  Map<String, dynamic> tojson() {
    return {
      'uid': uid,
      'name': name,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'email': email,
      'city': city,
      'userPassword': userPassword,
      'cartItems': cart
    };
  }
}

class CartItems {
  String? productName;
  String? productImageUrl;
  double? productPrice;
}
