import 'package:cloud_firestore/cloud_firestore.dart';
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
  AppUser();

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

  Stream<DocumentSnapshot<Map<String, dynamic>>> getuserData() {
    String userId = authInstance.currentUser!.uid;
    return db.collection('Users').doc(userId).snapshots();
  }
}

class CartItems {
  String? productName;
  String? productImageUrl;
  double? productPrice;
}
