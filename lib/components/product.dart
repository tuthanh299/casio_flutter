import '../screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

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


  @override
  Widget build(BuildContext context) {
    return
      //components
      InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProductDetail( /* productId : prodId, */ ))
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
                checksale(sale!, price!)
                //end gia
              ],
            ),
          ),
        )
      );
    //end components
  }
}

checksale(int sale, int price) {
  if (sale == 0) {
    return Text('$priceđ',
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
            '$salepriceđ',
            style: const TextStyle(
                color: Colors.red,
                fontSize: 13
            ),
          ),
          //end giá giảm
          const SizedBox(width: 5,),
          //giá gốc
          Text(
            '$priceđ',
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
