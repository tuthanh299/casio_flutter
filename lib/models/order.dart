import 'package:cloud_firestore/cloud_firestore.dart';

class Order1 {
  String? id;
  String? user_id;
  String? address;
  String? fullname;
  String? phone;
  int? date;
  double? total;
  int? qty;
  bool? status;

  Order1({
    this.id,
    this.user_id,
    this.address,
    this.phone,
    this.fullname,
    this.date,
    this.total,
    this.qty,
    this.status
  });

  Map<String, dynamic> toJSON() => {
    'id': id,
    'user_id': user_id,
    'address': address,
    'phone': phone,
    'fullname': fullname,
    'date': date,
    'total': total,
    'qty': qty,
    'status': status,
  };

  static Order1 fromJSON(Map<String, dynamic> json) => Order1(
    id: json['id'],
    user_id: json['user_id'],
    address: json['address'],
    phone: json['phone'],
    fullname: json['fullname'],
    date: json['date'],
    total: json['total'],
    qty: json['qty'],
    status: json['status'],
  );

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (user_id != null) "user_id": user_id,
      if (address != null) "address": address,
      if (phone != null) "phone": phone,
      if (fullname != null) "fullname": fullname,
      if (date != null) "date": date,
      if (total != null) "total": total,
      if (qty != null) "total": qty,
      if (status != null) "status": status,
    };
  }

  factory Order1.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot
      ) {
    final data = snapshot.data();
    return Order1(
      id: data?['id'],
      user_id: data?['user_id'],
      address: data?['address'],
      phone: data?['phone'],
      date: data?['Order1_date'],
      fullname: data?['fullname'],
      total: data?['total'],
      qty: data?['qty'],
      status: data?['status'],
    );
  }
}