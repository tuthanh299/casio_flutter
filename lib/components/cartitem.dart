import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/product_detail_screen.dart';

class CartItem extends StatefulWidget {
  CartItem({
    Key? key,
    this.productID,
    this.uid,
    this.total,
    required this.name,
    required this.src,
    required this.prod_price,
    required this.prod_sale,
    required this.final_price,
    this.qty,
    this.onPlus,
    this.onMinus,
    this.discount,
  }) : super(key: key);

  final String? productID;
  final String? uid;
  final double? total;
  int? qty;
  int? discount;

  final String name;
  final String src;
  final double prod_price;
  final double prod_sale;
  final double final_price;
  final VoidCallback? onPlus;
  final VoidCallback? onMinus;


  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool isCheck = true;
  var oCcy = NumberFormat("#,###đ", "vi_VN");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProductDetail(productId: widget.productID!,))
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 6.5,
            //padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  widget.src,
                  height: 100,
                  width: 100,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        widget.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ),
                    //gia sp
                    checksale(widget.discount!, widget.prod_price),
                    //end gia sp
                    Row(
                      children: [
                        IconButton(
                            onPressed: widget.onMinus,
                            icon: const Icon(
                              Icons.remove,
                              size: 15,
                            )
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.only( left: 10, right: 10),
                            child: Text(
                              widget.qty.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: widget.onPlus,
                            icon: const Icon(
                              Icons.add,
                              size: 15,
                            )),
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(1.0),
                              child: Text(
                                'Thành tiền:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                oCcy.format(widget.final_price),
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )
    );
  }

  checksale(int discount, double price) {
    if(discount == 0) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Text(
              //'${widget.prod_price}đ',
              oCcy.format(widget.prod_price),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Text(
              oCcy.format(widget.prod_price),
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 25,),
            Text(
              oCcy.format(widget.prod_sale),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }
  }
}

