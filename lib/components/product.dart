import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  Product({
    Key? key,
    required this.src,
    required this.price,
    required this.name,
    required this.sale,
  }) : super(key: key);

  String src = '';
  String price = '';
  String name = '';
  String sale;


  @override
  Widget build(BuildContext context) {
    return
      //components
      InkWell(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
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
                  height: 125,
                  width: 125,
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
                checksale(sale, price)
                //end gia
              ],
            )
        ),
      );
    //end components
  }
}

checksale(String sale, String price) {
  if (sale == '0') {
    return Text(price,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 13,
      ),
    );
  } else {
    return                 //có sale
      Row(
        children: [
          //giá giảm
          Text(
            sale,
            style: const TextStyle(
                color: Colors.red,
                fontSize: 13
            ),
          ),
          //end giá giảm
          const SizedBox(width: 5,),
          //giá gốc
          Text(price,
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
