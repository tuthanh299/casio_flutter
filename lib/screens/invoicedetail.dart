import 'package:flutter/material.dart';

class InvoiceDetail extends StatefulWidget {
  const InvoiceDetail({Key? key}) : super(key: key);

  @override
  State<InvoiceDetail> createState() => _InvoiceDetailState();
}

class _InvoiceDetailState extends State<InvoiceDetail> {
  double cochu = 15;
  @override
  Widget build(BuildContext context) {
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
                  Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
                    margin: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Thời gian: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                            Text('12:30 AM 30/10/2023', style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Text('Tên người nhận: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                            Text('Lê Thanh Tú', style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Text('Số điện thoại: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                            Text('0123456789', style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Địa chỉ: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                        ),
                        const SizedBox(height: 10,),
                        Text('65 Đ. Huỳnh Thúc Kháng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh', style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Text('Trạng thái: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                            Text('Hoàn thành', style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //end thông tin người dùng
                  //sản phẩm
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                    ),
                    child: Row(
                      children: [
                        Image.network('https://timemart.vn/upload/product/dong-ho-casio/GA-2140RE-1A-000.jpg', height: 100, width: 100,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const Text('Đồng Hồ G-SHOCK P8013'),
                            const SizedBox(height: 30,),
                            const Text('550.000đ', style: TextStyle(color: Colors.grey),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(width: MediaQuery.of(context).size.width / 1.6,),
                                const Text('x1', style: TextStyle(color: Colors.black),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                    ),
                    child: Row(
                      children: [
                        Image.network('https://timemart.vn/upload/product/dong-ho-casio/GA-2140RE-1A-000.jpg', height: 100, width: 100,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const Text('Đồng Hồ G-SHOCK P8013'),
                            const SizedBox(height: 30,),
                            const Text('550.000đ', style: TextStyle(color: Colors.grey),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(width: MediaQuery.of(context).size.width / 1.6,),
                                const Text('x1', style: TextStyle(color: Colors.black),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //end sản phẩm
                  //tổng tiền
                  Container(
                    margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Tổng'),
                        Text('1.852.000₫', style: TextStyle(color: Colors.red),),
                      ],
                    ),
                  )
                  //end tổng tiền
                ],
              )
          ),
          //navbar
          NavigationBar(
            height: 30,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined, color: Colors.white,),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.search_outlined, color: Colors.white,),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.menu_outlined, color: Colors.white,),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.white,),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline_outlined, color: Colors.white,),
                label: '',
              ),
            ],
            backgroundColor: Colors.black,
          )
          //end navbar
        ],
      ),
    );
  }
}
