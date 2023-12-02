import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/product.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController txtSearch = TextEditingController();

  Stream<QuerySnapshot> getDataSearch(String searchstring) {
    return FirebaseFirestore.instance
        .collection('products')
        .where('name', isEqualTo: searchstring)
        .snapshots();
  }

  var searchProduct = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                searchProduct = value;
              });
            },
            controller: txtSearch,
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                prefixIcon: const Icon(Icons.search_outlined),
                suffixIcon: GestureDetector(
                  child: const Icon(
                    Icons.search_outlined,
                    color: Colors.black,
                  ),
                ),
                hintText: 'Nhập tên sản phẩm'),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'SẢN PHẨM TÌM KIẾM',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          StatefulBuilder(builder: (context, searchState) {
            return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('products')
                  .orderBy('name')
                  .startAt([searchProduct]).endAt(
                      ["$searchProduct\uf8ff"]).snapshots(),
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
                  if (documents.isEmpty) {
                    return const Center(
                      child: Text('Không có dữ liệu'),
                    );
                  } else {
                    return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: documents.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Product(
                            prodId: documents[index].id.toString(),
                            src: documents[index]['thumbnail'][0].toString(),
                            name: documents[index]['name'],
                            sale: documents[index]['discount'],
                            price: documents[index]['price'],
                          );
                        });
                  }
                }
              },
            );
          })
        ],
      ),
    ));
  }
}
