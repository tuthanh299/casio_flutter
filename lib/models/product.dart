import 'package:cloud_firestore/cloud_firestore.dart';
/* Khai bao bien */
class Product2 {
  String? id;
  String? user_id;
  String name;
  int price;
  int? discount;
  List? thumbnail;
  String? desc;
  bool? star;
  bool antiwater;
/* Khai bao lai lan nua */
  Product2({
    this.id,
    this.user_id,
    required this.name,
    required this.price,
    this.discount,
    this.thumbnail,
    this.desc,
    this.star,
    required this.antiwater
  });
/* Đọc dữ liệu từ firebase to json */
  Map<String, dynamic> toJSON() => {
    'id': id,
    'user_id': user_id,
    'name': name,
    'price': price,
    'discount': discount,
    'thumbnail': thumbnail,
    'desc': desc,
    'star': star,
    'antiwater': antiwater,
  };




  
  /* --- */
/* Đẩy dữ liệu từ json lên firebase */
  static Product2 fromJSON(Map<String, dynamic> json) => Product2(
    id: json['id'],
    user_id: json['user_id'],
    name: json['name'],
    price: json['price'],
    discount: json['discount'],
    thumbnail: json['thumbnail'],
    desc: json['desc'],
    star: json['star'],
    antiwater: json['antiwater'], 
  ); 
   
}