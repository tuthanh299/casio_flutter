import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  'assets/imgs/ga-2140re-1a.jpg',
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
                      'assets/imgs/ga-2140re-1a.jpg',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      'assets/imgs/ga-2140re-1a.jpg',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Đồng Hồ Nữ Chính Hãng CASIO LTP-1094E-1A',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  '752.000 đ',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  '752.000 đ',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Mẫu đồng hồ có kích thước nhỏ của dòng 5600 mang tính biểu tượng hoàn thiện bằng chất liệu kim loại sang trọng. Thiết kế vuông vắn của GM-5600, được sử dụng ngay từ mẫu đầu tiên, đã được giảm bớt kích thước để đạt được trọng lượng nhẹ và vừa vặn. Vỏ đường gờ được làm bằng kim loại mạ ion vàng hồng và dây đeo là dây đeo G-SHOCK màu be sang trọng.',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: RichText(
              text: const TextSpan(
                  text: 'Chống nước: ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                  children: [
                    TextSpan(
                        text: 'có',
                        style: TextStyle(
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
    );
  }
}
