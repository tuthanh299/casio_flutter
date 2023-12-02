import 'package:casio_flutter/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Product extends StatelessWidget {
  Product({
    Key? key,
    required this.src,
    this.price,
    required this.name,
    this.sale,
    required this.prodId
  }) : super(key: key);

  String prodId;
  String src = '';
  int? price = 0;
  String name = '';
  int? sale;

  var oCcy = NumberFormat("#,###đ", "vi_VN");


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        //components
        InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProductDetail(productId: prodId,))
              );
            },
            child: Center(
              child: Container(
                //padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                        width: 2.0,
                        color: Colors.black26
                    )
                ),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(src),
                      height: 110,
                      width: 110,
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10
                      ),
                    ),
                    const SizedBox(height: 5,),
                    //gia
                    checksale(sale!, price!, oCcy)
                    //end gia
                  ],
                ),
              ),
            )
        ),
        //end component
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          height: 40,
          width: 40,
          child: Center(child: Text('$sale%',style: const TextStyle(color: Colors.white,),),)
        ),
      ],
    );
  }
}

checksale(int sale, int price, NumberFormat oCcy) {
  if (sale == 0) {
    return Text(oCcy.format(price),
      style: const TextStyle(
        color: Colors.red,
        fontSize: 13,
      ),
    );
  } else {
    //có sale
    double saleprice = price - (price * (sale / 100));
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //giá giảm
          Text(
            //'$salepriceđ',
            oCcy.format(saleprice),
            style: const TextStyle(
                color: Colors.red,
                fontSize: 13
            ),
          ),
          //end giá giảm
          const SizedBox(width: 5,),
          //giá gốc
          Text(
            oCcy.format(price),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          //end giá gốc
        ],
      );
  //end có sale
  }
}
