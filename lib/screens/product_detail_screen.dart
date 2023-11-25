import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/provider.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({
    required this.productId,
    super.key,
  });

  final String productId;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: /*FutureBuilder(
        future: getProduct(widget.productId),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          } else if (snapshot.hasError) {
            return const Center(child: Text('Đã xảy ra sự cố'),);
          } else if(!snapshot.hasData) {
            return const Center(child: Text('Không có dữ liệu'),);
          } else {
            final prod = snapshot.data;
            final gallery = FirebaseFirestore.instance.collection('gallery').where('product_id', isEqualTo: prod?.id);
            return prod == null
                ? const Center(child: Text('Đã xảy ra sự cố'),)
                : Center(child: buildProd(prod));
          }
        }
      )*/
            FutureBuilder(
                future: getProductAndGallery(widget.productId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Đã xảy ra sự cố'),
                    );
                  } else if (!snapshot.hasData) {
                    return const Center(
                      child: Text('Không có dữ liệu'),
                    );
                  } else {
                    final prod = snapshot.data;
                    //final gallery = FirebaseFirestore.instance.collection('gallery').where('product_id', isEqualTo: prod?.id).snapshots();
                    return prod == null
                        ? const Center(
                            child: Text('Đã xảy ra sự cố'),
                          )
                        : Center(child: buildProd2(prod));
                  }
                }));
  }

  Widget buildProd(Product2 prod) => ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 50, left: 2),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 50,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      prod.thumbnail![0],
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          prod.thumbnail![0],
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          prod.thumbnail![0],
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  prod.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              checksale(prod.discount, prod.price),
              /*Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  prod.price.toString(),
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  (prod.price - (prod.price - prod.discount! / 100)).toString(),
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),*/
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  prod.desc!,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                      text: 'Chống nước: ',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 15),
                      children: [
                        TextSpan(
                            text: prod.antiwater ? 'có' : 'không',
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15))
                      ]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text(
                                    'Đã thêm vào giỏ',
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: [
                                    Container(
                                      padding: const EdgeInsets.only(right: 80),
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
                      child: const Text('thêm vào giỏ'),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      );

  Widget buildProd2(Product2 prod) => ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 50, left: 2),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 50,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      prod.thumbnail![0],
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          prod.thumbnail![1],
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          prod.thumbnail![2],
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  prod.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              checksale(prod.discount, prod.price),
              /*Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  prod.price.toString(),
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  (prod.price - (prod.price - prod.discount! / 100)).toString(),
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),*/
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  prod.desc!,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                      text: 'Chống nước: ',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 15),
                      children: [
                        TextSpan(
                            text: prod.antiwater ? 'có' : 'không',
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15))
                      ]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text(
                                    'Đã thêm vào giỏ',
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: [
                                    Container(
                                      padding: const EdgeInsets.only(right: 80),
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
                      child: const Text('thêm vào giỏ'),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      );

  checksale(int? sale, int price) {
    if (sale == 0) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          '$priceđ',
          style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough),
        ),
      );
    } else {
      double saleprice = (price - (price * sale! / 100));
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '$priceđ',
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              '$salepriceđ',
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    }
  }
}
