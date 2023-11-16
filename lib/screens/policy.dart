import 'package:flutter/material.dart';

class Policy extends StatefulWidget {
  const Policy({Key? key}) : super(key: key);

  @override
  State<Policy> createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 40,),
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
                      'CÁC CHÍNH SÁCH',
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
                          ]
                      ),
                    ),
                  ),
                ],
              )
          ),
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.1, bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                //đoạn 1
                SizedBox(height: 40,),
                Text('CHÍNH SÁCH BẢO MẬT', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('- Cám ơn quý khách đã quan tâm và truy cập vào website. Chúng tôi tôn trọng và cam kết sẽ bảo mật những thông tin mang tính riêng tư của Quý khách.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('- Bảo vệ dữ liệu cá nhân và gây dựng được niềm tin cho quý khách là vấn đề rất quan trọng với chúng tôi. Vì vậy, chúng tôi sẽ dùng tên và các thông tin khác liên quan đến quý khách tuân thủ theo nội dung của Chính sách bảo mật. Chúng tôi chỉ thu thập những thông tin cần thiết liên quan đến giao dịch mua bán.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                //end đoạn 1
                //đoạn 2
                SizedBox(height: 40,),
                Text('CHÍNH SÁCH ĐỔI TRẢ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('- Quý khách kiểm tra kỹ hàng xong mới sử dụng, khách có 5 ngày đổi hàng nếu sản phẩm lỗi do nhà sản xuất. Quá 5 ngày Shop không chấp nhận đổi / trả, chỉ chấp nhận bảo hành.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('- Sản phẩm phải được bảo quản kỹ lưỡng, không móp méo, dán băng dính lên hộp, không làm biến dạng và trầy xước.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('- Thời hạn đổi hàng là 05 ngày kể từ khi quý khách nhận được sản phẩm.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                //end đoạn 2
                //đoạn 3
                SizedBox(height: 40,),
                Text('CHÍNH SÁCH BẢO HÀNH', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('- Đồng hồ G-Shock được bảo hành 5 năm toàn quốc - 1 năm quốc tế cho thân máy với thẻ bảo hành quốc tế đi kèm.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('- Các lỗi về thân máy được bảo hành thường gặp là: vào nước, đồng hồ không chạy, màn hình nhấp nháy,...', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('- Dây, vỏ cũng như mặt kính không nằm trong danh sách được bảo hành.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                //end đoạn 3
              ],
            ),
          )
        ],
      ),
    );
  }
}
