import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartItemNoCheckBox extends StatefulWidget {
  const CartItemNoCheckBox({
    Key? key,
    this.productID,
    this.uid,
    this.qty,
    required this.name,
    required this.src,
    required this.prod_price,
    required this.final_price,
    this.prod_sale,
    this.discount,
  }) : super(key: key);

  final String? productID;
  final String? uid;
  final int? qty;
  final int? discount;

  final String name;
  final String src;
  final double prod_price;
  final double? prod_sale;
  final double final_price;


  @override
  State<CartItemNoCheckBox> createState() => _CartItemNoCheckBoxState();
}

class _CartItemNoCheckBoxState extends State<CartItemNoCheckBox> {
  var oCcy = NumberFormat("#,###đ", "vi_VN");

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        child: Container(
          width: 380,
          decoration:
          BoxDecoration(border: Border.all(color: Colors.black)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(widget.src),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        widget.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                  ),
                  //gia sp
                  checksale(widget.discount!, widget.prod_price),
                  //end gia sp
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Text(
                          'x${widget.qty}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 3,),
                        Text(
                          oCcy.format(widget.final_price),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
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

