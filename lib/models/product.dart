import 'package:cloud_firestore/cloud_firestore.dart';

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

  Product2(
      {this.id,
      this.user_id,
      required this.name,
      required this.price,
      this.discount,
      this.thumbnail,
      this.desc,
      this.star,
      required this.antiwater});

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

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (user_id != null) "user_id": user_id,
      //if (name != null) "name": name,
      //if (price != null) "price": price,
      if (discount != null) "discount": discount,
      if (thumbnail != null) "thumbnail": thumbnail,
      if (desc != null) "desc": desc,
      if (star != null) "star": star,
      //if (antiwater != null) "antiwater": antiwater,
    };
  }

  factory Product2.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Product2(
      id: data?['id'],
      user_id: data?['user_id'],
      name: data?['name'],
      price: data?['price'],
      discount: data?['discount'],
      thumbnail: data?['thumbnail'],
      desc: data?['desc'],
      star: data?['star'],
      antiwater: data?['antiwater'],
    );
  }
}
