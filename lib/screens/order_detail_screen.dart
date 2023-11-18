import '/screens/order_screen.dart';

import 'edit_address_screen.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Order()));
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Padding(
          padding: EdgeInsets.only(left: 80),
          child: Text(
            'Thanh toán',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 10.0,
                    color: Colors.grey,
                  ),
                ]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 180,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(5),
                child: Container(
                  width: 390,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_pin),
                      const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Địa chỉ nhận hàng',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Nguyễn Triệu Hải',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '0962873145',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13),
                              ),
                            ),
                            SizedBox(
                              width: 310,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Đ. Huỳnh Thúc Kháng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ]),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditAddress()));
                          },
                          icon: const Icon(Icons.edit))
                    ],
                  ),
                )),
            Container(
                height: 130,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(5),
                child: Container(
                  width: 390,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 70,
                          height: 80,
                          child: Image.asset('assets/imgs/ga-2140re-1a.jpg')),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 290,
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                'Đồng Hồ Nữ Chính Hãng CASIO LTP-1094E-1A',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  '752.000 đ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 290, top: 10),
                            child: Text('x1'),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
      persistentFooterButtons: [
        Container(
            height: 50,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Row(children: [
              const Padding(
                padding: EdgeInsets.only(left: 170.0, top: 5, right: 30),
                child: Column(
                  children: [
                    Text(
                      'Tổng: ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        '752.000 đ',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text(
                              'Thanh toán thành công!',
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              Container(
                                padding: const EdgeInsets.only(right: 100),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.green),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Xác nhận')),
                              )
                            ],
                          ));
                },
                child: const Text('Thanh toán'),
              )
            ]))
      ],
    );
  }
}
