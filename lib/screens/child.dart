import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components/product.dart';

class Child extends StatefulWidget {
  const Child({Key? key}) : super(key: key);

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  final Stream<QuerySnapshot> _treem = FirebaseFirestore.instance
      .collection('products')
      .where('category_id', isEqualTo: 3)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
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
                  'TRẺ EM',
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
                      ]),
                ),
              ),
            ],
          )),
          //sp
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
                    itemCount: documents.length,
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
          //end sp
        ],
      ),
    );
  }
}
