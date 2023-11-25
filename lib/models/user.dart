import 'package:cloud_firestore/cloud_firestore.dart';

class User1 {
  String? fullname;
  String? email;
  String? uid;
  String? address;
  String? number;

  User1({
    this.fullname,
    this.email,
    this.uid,
    this.address,
    this.number
  });

  Map<String, dynamic> toJSON() => {
    'fullname': fullname,
    'email': email,
    'uid': uid,
    'address': address,
    'number': number,
  };

  static User1 fromJSON(Map<String, dynamic> json) => User1(
    fullname: json['fullname'],
    email: json['email'],
    uid: json['uid'],
    address: json['address'],
    number: json['number'],
  );

  Map<String, dynamic> toFirestore() {
    return {
      if (fullname != null) "fullname": fullname,
      if (email != null) "email": email,
      if (address != null) "address": address,
      if (number != null) "number": number,
    };
  }

  factory User1.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return User1(
      fullname: data?['fullname'],
      email: data?['email'],
      address: data?['address'],
      number: data?['number'],
    );
  }
}