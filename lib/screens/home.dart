import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components/product.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Stream<QuerySnapshot> _noibat = FirebaseFirestore.instance
      .collection('products')
      .where('star', isEqualTo: true)
      .snapshots();
  final Stream<QuerySnapshot> _nam = FirebaseFirestore.instance
      .collection('products')
      .where('category_id', isEqualTo: 1)
      .snapshots();
  final Stream<QuerySnapshot> _nu = FirebaseFirestore.instance
      .collection('products')
      .where('category_id', isEqualTo: 2)
      .snapshots();
  final Stream<QuerySnapshot> _treem = FirebaseFirestore.instance
      .collection('products')
      .where('category_id', isEqualTo: 3)
      .snapshots();
  int total = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //banner
              const Image(
                image: AssetImage('assets/imgs/topbanner.png'),
              ),
              //end banner
              //sp noi bat
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Text(
                  'SẢN PHẨM NỔI BẬT',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              StreamBuilder(
                stream: _noibat,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Lỗi'),
                    );
                  } else if (!snapshot.hasData) {
                    return const Center(
                      child: Text('Không có dữ liệu'),
                    );
                  } else {
                    final documents = snapshot.data!.docs;
                    return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Product(
                            prodId: documents[index].id,
                            src: documents[index]['thumbnail'][0].toString(),
                            name: documents[index]['name'],
                            sale: documents[index]['discount'],
                            price: documents[index]['price'],
                          );
                        });
                  }
                },
              ),
              //end sp noi bat
              //nam
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  'ĐỒNG HỒ NAM',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              StreamBuilder(
                stream: _nam,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Lỗi'),
                    );
                  } else if (!snapshot.hasData) {
                    return const Center(
                      child: Text('Không có dữ liệu'),
                    );
                  } else {
                    final documents = snapshot.data!.docs;
                    return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Product(
                            prodId: documents[index].id,
                            src: documents[index]['thumbnail'][0].toString(),
                            name: documents[index]['name'],
                            sale: documents[index]['discount'],
                            price: documents[index]['price'],
                          );
                        });
                  }
                },
              ),
              /*Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //components
                      Product(
                        prodId: '',
                        src: 'assets/imgs/ga-2140re-1a.jpg',
                        price: 3999000,
                        name: 'CASIO GA-2140RE-1A',
                        sale: 0,
                      ),
                      //end components
                      //components
                      Product(
                        prodId: '',
                        src: 'assets/imgs/ga-2140re-1a.jpg',
                        price: 3999000,
                        name: 'CASIO GA-2140RE-1A',sale: 0,
                      ),
                      //end components
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //components
                      Product(
                        prodId: '',
                        src: 'assets/imgs/ga-2140re-1a.jpg',
                        price: 3999000,
                        name: 'CASIO GA-2140RE-1A',
                        sale: 0,
                      ),
                      //end components
                      //components
                      Product(
                        prodId: '',
                        src: 'assets/imgs/ga-2140re-1a.jpg',
                        price: 3999000,
                        name: 'CASIO GA-2140RE-1A',
                        sale: 0,
                      ),
                      //end components
                    ],
                  ),
                ],
              ),*/
              //end nam
              //nu
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  'ĐỒNG HỒ NỮ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              StreamBuilder(
                stream: _nu,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Lỗi'),
                    );
                  } else if (!snapshot.hasData) {
                    return const Center(
                      child: Text('Không có dữ liệu'),
                    );
                  } else {
                    final documents = snapshot.data!.docs;
                    return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Product(
                            prodId: documents[index].id,
                            src: documents[index]['thumbnail'][0].toString(),
                            name: documents[index]['name'],
                            sale: documents[index]['discount'],
                            price: documents[index]['price'],
                          );
                        });
                  }
                },
              ), //end nu
              //tre em
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'ĐỒNG HỒ TRẺ EM',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              StreamBuilder(
                stream: _treem,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Lỗi'),
                    );
                  } else if (!snapshot.hasData) {
                    return const Center(
                      child: Text('Không có dữ liệu'),
                    );
                  } else {
                    final documents = snapshot.data!.docs;
                    return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Product(
                            prodId: documents[index].id,
                            src: documents[index]['thumbnail'][0].toString(),
                            name: documents[index]['name'],
                            sale: documents[index]['discount'],
                            price: documents[index]['price'],
                          );
                        });
                  }
                },
              ),
              //end tre em
              //banner cuoi
              Container(
                margin: EdgeInsets.fromLTRB(
                    0, 10, 0, MediaQuery.of(context).size.height / 20),
                child: Image(
                  image: const AssetImage('assets/imgs/bottombanner.jpg'),
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              //end banner cuoi
            ],
          ),
        ],
      ),
      /*Flexible(
        child:
      ),*/
    );
  }

  /*Widget buildProduct(Product1 prod) =>  Product(
    src: prod.thumbnail!,
    price: prod.price,
    name: prod.name!,
    sale: '100'//0,
  );*/
}
