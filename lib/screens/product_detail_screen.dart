import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/provider.dart';
import '../models/cart_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/product.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    required this.productId,
    super.key,
  });

  final String productId;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<CartItem1> allcartitem = [];
  var oCcy = NumberFormat("#,###đ", "vi_VN");

  fetch() async {
    var records =
        await FirebaseFirestore.instance.collection('cartitems').get();
    getAllOrder(records);
  }

  getAllOrder(QuerySnapshot<Map<String, dynamic>> records) {
    var list = records.docs
        .map((e) => CartItem1(
              productID: e['productID'],
              uid: e['uid'],
              qty: e['qty'],
              cartItemId: e['cartItemId'],
            ))
        .toList();
    allcartitem = list;
  }

  @override
  void initState() {
    // TODO: implement initState
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool checkDup = false;

    return Scaffold(
        key: _scaffoldKey,
        body: FutureBuilder(
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
                    : Center(child: buildProd2(prod, checkDup));
              }
            }));
  }

  Widget buildProd2(Product2 prod, bool check) {
    String? cartItemId;
    int? qty_temp;
    return ListView(
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
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            checksale(prod.discount, prod.price),
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
                    onPressed: () async {
                      //neu chua co => tao moi
                      //co san pham => sua so luong
                      //kiem tra gio hang, co thi cho dung va lay id, chuyen trang thai checkDup de tien hanh update
                      for (var list in allcartitem) {
                        if (list.productID.toString() == widget.productId &&
                            list.uid ==
                                FirebaseAuth.instance.currentUser!.uid) {
                          cartItemId = list.cartItemId;
                          qty_temp = list.qty;
                          check = true;
                          break;
                        }
                      }
                      //end kiem tra
                      //check trang thai checkDup
                      if (check) {
                        FirebaseFirestore.instance
                            .collection('cartitems')
                            .doc(cartItemId)
                            .update({'qty': qty_temp! + 1}).then((value) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text(
                                      'Đã thêm vào giỏ',
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(right: 80),
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
                        });
                      } else {
                        final temp_cartid = FirebaseFirestore.instance
                            .collection('cartitems')
                            .doc()
                            .id;
                        final cart = CartItem1(
                          cartItemId: temp_cartid,
                          productID: widget.productId,
                          uid: FirebaseAuth.instance.currentUser!.uid,
                          qty: 1,
                        );
                        createCartItem(cart, temp_cartid).then((value) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text(
                                      'Đã thêm vào giỏ',
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(right: 80),
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.green),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Xác nhận',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )),
                                      )
                                    ],
                                  ));
                        });
                      }
                    },
                    //end tao moi

                    child: const Text(
                      'thêm vào giỏ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  checksale(int? sale, int price) {
    if (sale == 0) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          oCcy.format(price),
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
              oCcy.format(price),
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              oCcy.format(saleprice),
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
