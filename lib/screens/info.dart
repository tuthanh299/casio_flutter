import 'package:flutter/material.dart';

import 'package:casio_flutter/screens/changepass.dart';
import 'package:casio_flutter/screens/editinfo.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  double cochu = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  /*GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.chevron_left,
                              color: Colors.black,
                            ),
                          ),*/
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      'THÔNG TIN NGƯỜI DÙNG',
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
              const SizedBox(
                height: 40,
              ),
              //thông tin người dùng
              Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 25),
                margin: EdgeInsets.all(MediaQuery.of(context).size.width / 25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Tài khoản: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: cochu),
                        ),
                        Text(
                          'ductoan298',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: cochu),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Họ tên: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: cochu),
                        ),
                        Text(
                          'Lê Thanh Tú',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: cochu),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Số điện thoại: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: cochu),
                        ),
                        Text(
                          '0123456789',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: cochu),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Email: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: cochu),
                        ),
                        Text(
                          'demo@gmail.com',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: cochu),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Địa chỉ: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: cochu),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '65 Đ. Huỳnh Thúc Kháng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: cochu),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 23,
              ),
              //các nút
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ChangePass())
                      );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  decoration:
                      const BoxDecoration(color: Colors.lightGreenAccent),
                  child: const Center(
                    child: Text(
                      'Đổi mật khẩu',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const EditInfo())
                      );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  decoration:
                      const BoxDecoration(color: Colors.lightGreenAccent),
                  child: const Center(
                    child: Text(
                      'Chỉnh sửa hồ sơ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  decoration:
                      const BoxDecoration(color: Colors.lightGreenAccent),
                  child: const Center(
                    child: Text(
                      'Đăng xuất',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              //enc các nút
            ],
          )),
          //navbar
          /*NavigationBar(
            height: 30,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined, color: Colors.white,),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.search_outlined, color: Colors.white,),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.menu_outlined, color: Colors.white,),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.white,),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline_outlined, color: Colors.white,),
                label: '',
              ),
            ],
            backgroundColor: Colors.black,
          )*/
          //end navbar
        ],
      ),
    );
  }
}
