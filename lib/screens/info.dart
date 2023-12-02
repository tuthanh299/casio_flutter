import 'editpassword.dart';

import '../components/provider.dart';
import '../screens/editinfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  double cochu = 18;
  String uid = FirebaseAuth.instance.currentUser!.uid;

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
              const Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
              FutureBuilder<User1>(
                  future: getUser(uid),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Lỗi'));
                    } else if (!snapshot.hasData) {
                      return const Center(child: Text('Không có dữ liệu'));
                    } else {
                      final user = snapshot.data;
                      return user == null
                          ? const Center(
                              child: Text('Đã xảy ra sự cố'),
                            )
                          : buildInfo(user);
                    }
                  }),
              //end thong tin nguoi dung
              SizedBox(
                height: MediaQuery.of(context).size.height / 23,
              ),
              //các nút
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ChangePass()));
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
                      builder: (context) => const EditInfo()));
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
                  setState(() async {
                    await FirebaseAuth.instance.signOut();
                  });
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
              //end các nút
            ],
          )),
          //navbar
        ],
      ),
    );
  }

  Widget buildInfo(User1 us) => Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 25),
        margin: EdgeInsets.all(MediaQuery.of(context).size.width / 25),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Họ tên: ',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),
                ),
                Text(
                  us.fullname!,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),
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
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),
                ),
                Text(
                  us.number!,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),
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
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),
                ),
                Text(
                  us.email!,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              us.address!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: cochu),
            ),
          ],
        ),
      );
}
