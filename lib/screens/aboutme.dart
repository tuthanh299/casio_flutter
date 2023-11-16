import 'package:flutter/material.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
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
                      'VỀ CHÚNG TÔI',
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
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05, bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                //đoạn 1
                SizedBox(height: 40,),
                Text('G-SHOCK đã định nghĩa lại khái niệm về một chiếc đồng hồ bền bỉ.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Vào thời điểm mà hầu hết mọi người đều cho rằng đồng hồ rất dễ vỡ, một nhà sản xuất đã đứng ra thực hiện thử thách liều lĩnh với niềm tin rằng có thể chế tạo một chiếc đồng hồ không bị vỡ ngay cả khi bị rơi và va đập.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Nhóm nghiên cứu Dự án Tough đã được thành lập vào năm 1981 để biến điều dường như không thể đó thành có thể.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Và chỉ trong khoảng hai năm, nhóm nghiên cứu đã lần lượt tạo ra hơn 200 mẫu thiết kế.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Cuối cùng, họ cũng đã tạo ra được một cấu trúc chống va đập.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Điều này đã đánh dấu sự ra đời của một công nghệ bền bỉ đến tận cốt lõi.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Và kể từ đó, G-SHOCK đã không ngừng phát triển để theo đuổi độ bền tuyệt đối ở mọi phương diện, từ cấu tạo, chất liệu, cho đến các chức năng.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Ngày nay, niềm đam mê bất chấp thử thách và nỗ lực không ngừng nghỉ của đội ngũ phát triển đã cho ra đời Triple G Resist, một dòng sản phẩm với kết cấu vững chắc, có thể chịu được lực tác động của 3 loại gia tốc trọng trường.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Mục tiêu mà G-SHOCK luôn theo đuổi là khả năng hoạt động trong bất kỳ tình huống nào, và hơn thế nữa, chức năng Truy cập thông minh được tích hợp trong G-SHOCK cũng giúp đảm bảo khả năng hoạt động nhanh nhẹn, đáng tin cậy.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Mạnh mẽ hơn bao giờ hết, và không ngừng tìm đến những tầm cao mới, thử thách của G-SHOCK là chưa bao giờ kết thúc.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                //end đoạn 1
              ],
            ),
          )
        ],
      ),
    );
  }
}
