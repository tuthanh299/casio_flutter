import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/cartitem.dart';
import '../components/provider.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

import 'order_detail_screen.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  final Stream<QuerySnapshot> _giohang = FirebaseFirestore.instance
      .collection('cartitems')
      .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
  List<Product2> specificProduct = [];
  List<CartItem1> specificCartItem = [];
  double finaltotalprice = 0;
  bool checkNoCart = false;
  var oCcy = NumberFormat("#,###đ", "vi_VN");
  final doubleStreamController = StreamController<double>();

  getAllProduct(QuerySnapshot<Map<String, dynamic>> records) {
    var list = records.docs
        .map((e) => Product2(
              id: e['id'],
              name: e['name'],
              price: e['price'],
              antiwater: e['antiwater'],
              star: e['star'],
              desc: e['desc'],
              discount: e['discount'],
              thumbnail: e['thumbnail'],
            ))
        .toList();
    specificProduct = list;
  }

  getCartItem(QuerySnapshot<Map<String, dynamic>> records) {
    var list = records.docs
        .map((e) =>
            CartItem1(productID: e['productID'], uid: e['uid'], qty: e['qty']))
        .toList();
    specificCartItem = list;
  }

  fetch() async {
    var record1s = await FirebaseFirestore.instance
        .collection('cartitems')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    var record2s =
        await FirebaseFirestore.instance.collection('products').get();
    getCartItem(record1s);
    getAllProduct(record2s);
  }

  fetch2() {
    finaltotalprice = 0;
    for (var list1 in specificCartItem) {
      for (var list2 in specificProduct) {
        if (list1.productID == list2.id) {
          if (list2.discount == 0) {
            finaltotalprice += list2.price * list1.qty!.toInt();
          } else {
            double saleprice =
                list2.price - (list2.price * list2.discount!.toInt() / 100);
            finaltotalprice += saleprice * list1.qty!.toInt();
          }
        }
      }
    }
  }

  void smth() {
    Timer.periodic(const Duration(seconds: 1), (t) {
      finaltotalprice = 0;
      for (var list1 in specificCartItem) {
        for (var list2 in specificProduct) {
          if (list1.productID == list2.id) {
            if (list2.discount == 0) {
              finaltotalprice += list2.price * list1.qty!.toInt();
            } else {
              double saleprice =
                  list2.price - (list2.price * list2.discount!.toInt() / 100);
              finaltotalprice += saleprice * list1.qty!.toInt();
            }
          }
        }
      }
      doubleStreamController.sink.add(finaltotalprice);
    });
  }

  double finalproductsize(double price) {
    if (price == 0) {
      return 106;
    } else {
      return 64;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetch();
    fetch2();
    smth();
    super.initState();
  }

  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                'GIỎ HÀNG',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0.0, 10.0),
                        blurRadius: 2.0,
                        color: Colors.black26,
                      )
                    ]),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          StreamBuilder(
              stream: _giohang,
              builder: (context, streamSnapshot) {
                if (streamSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (streamSnapshot.hasError) {
                  return const Center(
                    child: Text('Lỗi'),
                  );
                } else if (!streamSnapshot.hasData) {
                  return const Center(
                    child: Text('Không có dữ liệu'),
                  );
                } else {
                  final documents = streamSnapshot.data!.docs;
                  //Product1 tempProduct = Product1(name: '', price: 1, antiwater: true);
                  if (streamSnapshot.data!.size == 0) {
                    checkNoCart = true;
                    return Center(
                        child: Column(
                      children: [
                        Image.asset(
                          'assets/imgs/nocart.png',
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                        ),
                        const Text('Giỏ hàng trống'),
                      ],
                    ));
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          return FutureBuilder(
                              future: getProduct(documents[index]['productID']),
                              builder: (context, futureSnapshot) {
                                if (futureSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (futureSnapshot.hasError) {
                                  return const Center(
                                    child: Text('Lỗi'),
                                  );
                                } else if (!futureSnapshot.hasData) {
                                  return const Center(
                                    child: Text('Không có dữ liệu'),
                                  );
                                } else {
                                  final future_docs = futureSnapshot.data;
                                  if (future_docs == null) {
                                    return const Center(
                                      child: Text('Đã xảy ra sự cố'),
                                    );
                                  } else {
                                    double salePrice =
                                        future_docs.price.toDouble() -
                                            (future_docs.price.toDouble() *
                                                future_docs.discount!.toInt() /
                                                100);
                                    double finalPrice;
                                    if (future_docs.discount == 0) {
                                      finalPrice =
                                          future_docs.price.toDouble() *
                                              documents[index]['qty'];
                                    } else {
                                      finalPrice =
                                          salePrice * documents[index]['qty'];
                                    }
                                    return CartItem(
                                      productID: future_docs.id,
                                      discount: future_docs.discount!.toInt(),
                                      name: future_docs.name,
                                      src: future_docs.thumbnail?[0],
                                      prod_price: future_docs.price.toDouble(),
                                      prod_sale: salePrice,
                                      final_price: finalPrice,
                                      qty: documents[index]['qty'],
                                      onPlus: () {
                                        setState(() {
                                          FirebaseFirestore.instance
                                              .collection('cartitems')
                                              .doc(streamSnapshot
                                                  .data!.docs[index].id)
                                              .update({
                                            'qty': documents[index]['qty'] + 1,
                                          });
                                        });
                                      },
                                      onMinus: () {
                                        if (documents[index]['qty'] == 1) {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: const Text('Thông báo'),
                                              content: const Text(
                                                  'Bạn chắc chắn muốn bỏ sản phẩm này ?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      FirebaseFirestore.instance
                                                          .collection(
                                                              'cartitems')
                                                          .doc(streamSnapshot
                                                              .data!
                                                              .docs[index]
                                                              .id)
                                                          .delete();
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Ok'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  child: const Text('Huỷ'),
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          setState(() {
                                            FirebaseFirestore.instance
                                                .collection('cartitems')
                                                .doc(streamSnapshot
                                                    .data!.docs[index].id)
                                                .update({
                                              'qty':
                                                  documents[index]['qty'] - 1,
                                            });
                                          });
                                        }
                                      },
                                    );
                                  }
                                }
                              });
                        });
                  }
                }
              }),
        ],
      ),
      persistentFooterButtons: [
        Container(
          height: 60,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Row(
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      fetch();
                      fetch2();
                    });
                  },
                  child: const Column(
                    children: [
                      Text(
                        'Cập nhật ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      Text(
                        'tổng giá tiền',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ],
                  )),
              StreamBuilder(
                  stream: doubleStreamController.stream,
                  builder: (context, streamSnapshot) {
                    if (streamSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (streamSnapshot.hasError) {
                      return const Center(
                        child: Text('Lỗi'),
                      );
                    } else if (!streamSnapshot.hasData) {
                      return const Center(
                        child: Text('Không có dữ liệu'),
                      );
                    } else {
                      final docs = streamSnapshot.data!;
                      return Padding(
                        padding: EdgeInsets.only(
                          left: finalproductsize(finaltotalprice),
                          top: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tổng: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              oCcy.format(docs),
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  if (checkNoCart) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Giỏ hàng trống, vui lòng thêm ít nhất 1 sản phẩm vào giỏ hàng để tiếp tục')));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderDetail(
                                  finalprice: finaltotalprice,
                                )));
                  }
                },
                child: const Text(
                  'Đặt hàng',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
