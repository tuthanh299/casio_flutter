import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/provider.dart';
import '../screens/product_detail_screen.dart';

class InvoiceDetail extends StatefulWidget {
  const InvoiceDetail({
    Key? key,
    required this.uid,
    required this.order_id,
    required this.date,
    required this.status,
    required this.total,
  }) : super(key: key);

  final String uid;
  final String order_id;
  final int date;
  final bool status;
  final double total;

  @override
  State<InvoiceDetail> createState() => _InvoiceDetailState();
}

class _InvoiceDetailState extends State<InvoiceDetail> {
  var oCcy = NumberFormat("#,###đ", "vi_VN");
  
  double cochu = 15;
  @override
  Widget build(BuildContext context) {
    var _orderdetail = FirebaseFirestore.instance.collection('orders_detail').where('order_id', isEqualTo: widget.order_id).snapshots();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 40,),
                  Center(
                    child: Row(
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
                          padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                          child: Text(
                            'CHI TIẾT',
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
                                ]
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                  //thông tin người dùng
                  FutureBuilder(
                    future: getUser(widget.uid),
                    builder: (context, futureSnapshot) {
                      if(futureSnapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator()
                        );
                      } else if(futureSnapshot.hasError) {
                        return const Center(
                          child: Text('Lỗi'),
                        );
                      } else if (!futureSnapshot.hasData) {
                        return const Center(
                          child: Text('Không có dữ liệu'),
                        );
                      } else {
                        final docs = futureSnapshot.data!;
                        final date1 = DateTime.fromMicrosecondsSinceEpoch(widget.date);
                        return Container(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
                          margin: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Thời gian: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                                  Text('${date1.hour}:${date1.minute} ${date1.day}/${date1.month}/${date1.year}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text('Tên người nhận: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                                  Text(docs.fullname.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text('Số điện thoại: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                                  Text(docs.number.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Địa chỉ: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                              ),
                              const SizedBox(height: 10,),
                              Text(docs.address.toString() == "" ? 'Trống' : docs.address.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text('Trạng thái: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                                  Text(widget.status ? 'Hoàn thành' : 'Chưa hoàn thành' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                                ],
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  ),
                  //end thông tin người dùng
                  //sản phẩm
                  StreamBuilder(
                    stream: _orderdetail,
                    builder: (context, streamSnapshot) {
                      if(streamSnapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator()
                        );
                      } else if(streamSnapshot.hasError) {
                        return const Center(
                          child: Text('Lỗi'),
                        );
                      } else if (!streamSnapshot.hasData) {
                        return const Center(
                          child: Text('Không có dữ liệu'),
                        );
                      } else {
                        final docs = streamSnapshot.data!.docs;
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: docs.length,
                          itemBuilder: (context, index) {
                            return FutureBuilder(
                              future: getProduct(docs[index]['product_id']),
                              builder: (context, futureSnapshot) {
                                if(futureSnapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator()
                                  );
                                } else if(futureSnapshot.hasError) {
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
                                    ? const Center(child: CircularProgressIndicator(),)
                                    : InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => ProductDetail(productId: future_docs.id!,))
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black)
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(future_docs.thumbnail![0], height: 100, width: 100,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              Text(future_docs.name),
                                              const SizedBox(height: 30,),
                                              //gia tien san pham
                                              checksale(future_docs.price, future_docs.discount!),
                                              //end gia tien san pham
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  SizedBox(width: MediaQuery.of(context).size.width / 1.6,),
                                                  Text('x${docs[index]['qty']}', style: const TextStyle(color: Colors.black),),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              }
                            );
                          }
                        );
                      }
                    }
                  ),
                  //end sản phẩm
                ],
              )
          ),
          //tổng tiền
          Container(
            margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Tổng:'),
                Text(oCcy.format(widget.total.toInt()), style: const TextStyle(color: Colors.red),),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          //end tổng tiền
        ],
      ),
    );
  }

  checksale(int price, int discount) {
    if (discount == 0) {
      return Text(oCcy.format(price), style: const TextStyle(color: Colors.red),);
    } else {
      var saleprice = price - price * discount / 100;
      return Row(
        children: [
          Text(oCcy.format(price),
            style: const TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough
            ),
          ),
          const SizedBox(width: 10,),
          Text(oCcy.format(saleprice), style: const TextStyle(color: Colors.red),),
        ],
      );
    }
  }
}
