import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/cart_item.dart';
import '../models/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/product.dart';
import '../models/order.dart';
import '../models/order_detail.dart';
import '../models/user.dart';

//insert dữ liệu
Future createUser(User1 us, uid) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc(uid);

  final json = us.toJSON();
  await docUser.set(json);
}

Future createCartItem(CartItem1 cartItem, cartId) async {
  final docCartItem =
      FirebaseFirestore.instance.collection('cartitems').doc(cartId);

  final json = cartItem.toJSON();
  await docCartItem.set(json);
}

Future createOrderDetail(OrderDetail1 order) async {
  final docOrder = FirebaseFirestore.instance.collection('orders_detail').doc();

  final json = order.toJSON();
  await docOrder.set(json);
}

Future createOrder(Order1 order, String order_id) async {
  final docOrder =
      FirebaseFirestore.instance.collection('orders').doc(order_id);

  final json = order.toJSON();
  await docOrder.set(json);
}
//end insert dữ liệu

//lấy dữ liệu
Future<User1> getUser(uid) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc(uid);
  final snapshot = await docUser.get();

  return User1.fromJSON(snapshot.data()!);
}

Future<Product2> getProduct(prodid) async {
  final docProd = FirebaseFirestore.instance.collection('products').doc(prodid);
  final snapshot = await docProd.get();

  return Product2.fromJSON(snapshot.data()!);
}

Future<List<CartItem1>> getOrderDetailList() async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('cartitems')
      .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get();
  List<CartItem1> listorderdetail = [];
  for (var element in snapshot.docs) {
    Map<String, dynamic> data = element.data() as Map<String, dynamic>;
    CartItem1 orddetail = CartItem1.fromJSON(data);

    listorderdetail.add(orddetail);
  }
  return listorderdetail;
}

Future<Product2> getProductAndGallery(prodid) async {
  final docProd = FirebaseFirestore.instance.collection('products').doc(prodid);
  final snapshot = await docProd.get();

  return Product2.fromJSON(snapshot.data()!);
}

Future<Order1> getOrder(ordid) async {
  final docProd = FirebaseFirestore.instance.collection('orders').doc(ordid);
  final snapshot = await docProd.get();

  return Order1.fromJSON(snapshot.data()!);
}

//end lấy dữ liệu