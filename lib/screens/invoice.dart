import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'invoicedetail.dart';

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  final Stream<QuerySnapshot> _orders = FirebaseFirestore
      .instance
      .collection('orders')
      .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
  String uid = FirebaseAuth.instance.currentUser!.uid;
  
  var oCcy = NumberFormat("#,###đ", "vi_VN");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //chữ lsmuahang
          SizedBox(height: MediaQuery.of(context).size.height / 10,),
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
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      'LỊCH SỬ MUA HÀNG',
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
          //end chữ lsmuahang
          StreamBuilder(
            stream: _orders,
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
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    DateTime date = DateTime.fromMicrosecondsSinceEpoch(docs[index]['date']);
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text('Thời gian: ', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('${date.hour}:${date.minute} ${date.day}/${date.month}/${date.year}', style: const TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Trạng thái:', style: TextStyle(fontWeight: FontWeight.bold),),
                              Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.all(Colors.black),
                                  value: docs[index]['status'],
                                  onChanged: (bool? value) {
                                    setState(() {});
                                  }
                              )
                            ],
                          ),
                          /*Row(
                            children: [
                              const Text('Số lượng: ', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(docs[index]['qty'].toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),*/
                          //const SizedBox(height: 10,),
                          Row(
                            children: [
                              const Text('Thành tiền: ', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(oCcy.format(docs[index]['total']), style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => InvoiceDetail(
                                    uid: uid,
                                    order_id: docs[index].id,
                                    date: docs[index]['date'],
                                    total: docs[index]['total'],
                                    status: docs[index]['status'],
                                  )),
                                );
                              },
                              child: const Row(
                                children: [
                                  Text(
                                    'Chi tiết',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward, color: Colors.red,)
                                ],
                              )
                          )
                        ],
                      ),
                    );
                  }
                );
              }
            }
          )
        ],
      ),
    );
  }
}
