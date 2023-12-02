import 'dart:async';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/cart_item.dart';
import '../models/user.dart';
import '../models/order.dart';
import '../models/order_detail.dart';
import '../components/provider.dart';
import '../components/cart_item_no_checkbox.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key, this.finalprice});

  final finalprice;

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  final Stream<QuerySnapshot> _giohang = FirebaseFirestore.instance
      .collection('cartitems')
      .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
  String uid = FirebaseAuth.instance.currentUser!.uid;
  User1 us1 = User1();
  bool checkNoCart = false;
  List<CartItem1> allorder = [];

  var oCcy = NumberFormat("#,###đ", "vi_VN");

  void getInfo(User1 user1) {
    getUser(uid).then((value) {
      setState(() {
        user1.fullname = value.fullname;
        user1.number = value.number;
        user1.address = value.address;
        user1.email = value.email;
      });
    });
  }

  void getAllOrderDetail(List<CartItem1> ord) async {
    List<CartItem1> allorder = await getOrderDetailList();
    setState(() {
      for (var element in allorder) {
        ord.add(element);
      }
    });
  }

  void smth() {}

  @override
  void initState() {
    // TODO: implement initState

    //getUserNow(us1);
    getInfo(us1);
    getAllOrderDetail(allorder);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //chu thanh toan
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Text(
                  'THANH TOÁN',
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
            ],
          ),
          //end chu thanh toan
          const SizedBox(
            height: 10,
          ),
          //dia chi
          FutureBuilder(
              future: getUser(FirebaseAuth.instance.currentUser!.uid),
              builder: (context, futureSnapshot) {
                if (futureSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
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
                  return future_docs == null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : address(future_docs.fullname!, future_docs.number!,
                          future_docs.address!);
                }
              }),
          //end dia chi
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
                  final docs = streamSnapshot.data!.docs;
                  if (streamSnapshot.data!.size == 0) {
                    checkNoCart = true;
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        return FutureBuilder(
                            future: getProduct(docs[index]['productID']),
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
                                    finalPrice = future_docs.price.toDouble() *
                                        docs[index]['qty'];
                                  } else {
                                    finalPrice = salePrice * docs[index]['qty'];
                                  }
                                  return CartItemNoCheckBox(
                                    productID: future_docs.id,
                                    name: future_docs.name,
                                    src: future_docs.thumbnail?[0],
                                    final_price: finalPrice,
                                    qty: docs[index]['qty'],
                                    prod_price: future_docs.price.toDouble(),
                                    prod_sale: salePrice,
                                    discount: future_docs.discount!.toInt(),
                                  );
                                }
                              }
                            });
                      });
                }
              })
        ],
      ),
      persistentFooterButtons: [
        Container(
            height: 60,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 140, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tổng: ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      oCcy.format(widget.finalprice),
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  if (us1.address == "" || us1.number == "") {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Vui lòng nhập đầy đủ số điện thoại và địa chỉ')));
                  } else if (checkNoCart) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('lỗi')));
                  } else {
                    //-------
                    String order_id = FirebaseFirestore.instance
                        .collection('orders_detail')
                        .doc()
                        .id;
                    Order1 ord = Order1(
                      id: order_id,
                      user_id: uid,
                      address: us1.address,
                      phone: us1.number,
                      fullname: us1.fullname,
                      date: DateTime.now().microsecondsSinceEpoch,
                      total: widget.finalprice,
                      qty: allorder.length,
                      status: true,
                    );
                    createOrder(ord, order_id);
                    for (var list in allorder) {
                      OrderDetail1 anotherOrd = OrderDetail1(
                        uid: uid,
                        order_id: order_id,
                        product_id: list.productID,
                        qty: list.qty,
                      );
                      createOrderDetail(anotherOrd);
                    }
                    for (var list in allorder) {
                      FirebaseFirestore.instance
                          .collection('cartitems')
                          .doc(list.cartItemId)
                          .delete();
                    }
                    //-------
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text(
                                'Thanh toán thành công!',
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                Container(
                                  padding: const EdgeInsets.only(right: 80),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.green),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Xác nhận')),
                                )
                              ],
                            ));
                  }
                },
                child: const Text(
                  'Thanh toán',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ]))
      ],
    );
  }

  Widget address(String name, String phone, String add) {
    return Container(
      width: 385,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.location_pin),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Địa chỉ nhận hàng',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                //'Nguyễn Triệu Hải',
                name == "" ? 'Nhập họ tên' : name,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 13),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                //'0962873145',
                phone == "" ? 'Nhập số điện thoại' : phone,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 13),
              ),
            ),
            SizedBox(
              width: 310,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  //'Đ. Huỳnh Thúc Kháng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh',
                  add == "" ? 'Nhập địa chỉ' : add,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 13),
                ),
              ),
            ),
          ]),
          /*IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditAddress()));
              },
              icon: const Icon(Icons.edit))*/
        ],
      ),
    );
  }
}
