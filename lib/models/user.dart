import 'package:toms_palace/util/firebaseinstance.dart';

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

  AppUser.inituser(this.name, this.email, this.gender, this.address,
      this.phoneNumber, this.userPassword, this.uid, this.cart, this.city);

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

  Future getuserData() {
    String userId = authInstance.currentUser!.uid;
    return db.collection('Users').doc(userId).get();
  }
}

class CartItems {
  String? productName;
  String? productImageUrl;
  double? productPrice;
}
