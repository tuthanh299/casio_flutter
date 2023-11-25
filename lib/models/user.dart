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
 
}