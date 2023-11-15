import 'package:casio_flutter/screens/invoicedetail.dart';
import 'package:flutter/material.dart';

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  bool invoiceCheck = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Expanded(
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text('Thời gian: ', style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('12:30 AM 30/10/2023', style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Trạng thái:', style: TextStyle(fontWeight: FontWeight.bold),),
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.all(Colors.black),
                            value: invoiceCheck,
                            onChanged: (bool? value) {
                              setState(() {
                                invoiceCheck = value!;
                              });
                            }
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text('Số lượng: ', style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('2', style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: const [
                          Text('Thành tiền: ', style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('1.852.000đ', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const InvoiceDetail()),
                          );
                        },
                        child: Row(
                          children: const [
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
                )
              ],
            ),
          ),
          //navbar
          /*
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
           */
          //end navbar
        ],
      ),
    );
  }
}
