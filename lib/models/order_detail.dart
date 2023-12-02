import 'package:cloud_firestore/cloud_firestore.dart';

class OrderDetail1 {
  String? uid;
  String? order_id;
  String? product_id;
  int? qty;

  OrderDetail1({
    this.uid,
    this.order_id,
    this.product_id,
    this.qty,
  });

  Map<String, dynamic> toJSON() => {
    'id': uid,
    'order_id': order_id,
    'product_id': product_id,
    'qty': qty,
  };

  static OrderDetail1 fromJSON(Map<String, dynamic> json) => OrderDetail1(
    uid: json['uid'],
    order_id: json['order_id'],
    product_id: json['product_id'],
    qty: json['qty'],
  );

  Map<String, dynamic> toFirestore() {
    return {
      if (uid != null) "id": uid,
      if (order_id != null) "order_id": order_id,
      if (product_id != null) "product_id": product_id,
      if (qty != null) "qty": qty,
    };
  }

  factory OrderDetail1.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return OrderDetail1(
      uid: data?['uid'],
      order_id: data?['order_id'],
      product_id: data?['product_id'],
      qty: data?['qty'],
    );
  }
}