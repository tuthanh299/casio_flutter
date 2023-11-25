import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product.dart';


import '../models/user.dart';

//insert dữ liệu
Future createUser(User1 us, uid) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc(uid);

  final json = us.toJSON();
  await docUser.set(json);
}
//end insert dữ liệu

//lấy dữ liệu
Future<User1> getUser(uid) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc(uid);
  final snapshot = await docUser.get();

  return User1.fromJSON(snapshot.data()!);
}
 

Future<Product2> getProductAndGallery(prodid) async {
  final docProd = FirebaseFirestore.instance.collection('products').doc(prodid);
  final snapshot = await docProd.get();

  return Product2.fromJSON(snapshot.data()!);
}

//end lấy dữ liệu