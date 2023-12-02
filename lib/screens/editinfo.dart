import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/provider.dart';
import '../models/user.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({Key? key}) : super(key: key);

  @override
  State<EditInfo> createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  TextEditingController txtFullname = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtAdd = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  double cochu = 18;

  var user = FirebaseAuth.instance.currentUser!;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  List<User1> alluser = [];
  bool checkEmail = false;
  bool cpass = true;

  fetch() async {
    var records = await FirebaseFirestore.instance.collection('users').get();
    getAllUser(records);
  }

  getAllUser(QuerySnapshot<Map<String, dynamic>> records) {
    var list = records.docs
        .map((e) => User1(
              email: e['email'],
              number: e['number'],
            ))
        .toList();
    alluser = list;
  }

  @override
  void initState() {
    // TODO: implement initState
    fetch();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    txtPhone.dispose();
    txtAdd.dispose();
    txtFullname.dispose();
    txtPass.dispose();
    txtEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: StatefulBuilder(
      builder: (context, editState) {
        return FutureBuilder(
          future: getUser(uid),
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
              final user = snapshot.data!;
              txtFullname.text = user.fullname!;
              txtEmail.text = user.email!;
              txtPhone.text = user.number!;
              txtAdd.text = user.address!;
              txtPass.clear();
              return ListView(
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
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
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
                  //sửa thông tin
                  //Ô nhập họ tên
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Họ tên:',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.black26,
                          ),
                          width: MediaQuery.of(context).size.width / 1,
                          child: TextField(
                            controller: txtFullname,
                            obscureText: false,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                border: InputBorder.none,
                                hintText: 'Nhập họ tên',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 15)),
                          ),
                        )
                      ],
                    ),
                  ),
                  //end ô họ tên
                  //Ô sđt
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Số điện thoại:',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.black26,
                          ),
                          width: MediaQuery.of(context).size.width / 1,
                          child: TextField(
                            controller: txtPhone,
                            obscureText: false,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                border: InputBorder.none,
                                hintText: 'Nhập số điện thoại',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 15)),
                          ),
                        )
                      ],
                    ),
                  ),
                  //end ô số điện thoạt
                  //Ô nhập mail
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email:',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.black26,
                          ),
                          width: MediaQuery.of(context).size.width / 1,
                          child: TextField(
                            onChanged: (value) {
                              editState(() {
                                checkEmail = false;
                              });
                            },
                            controller: txtEmail,
                            obscureText: false,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                border: InputBorder.none,
                                hintText: 'Nhập email',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 15)),
                          ),
                        )
                      ],
                    ),
                  ),
                  //end ô nhập mail
                  //Ô nhập địa chỉ
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Địa chỉ:',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.black26,
                          ),
                          width: MediaQuery.of(context).size.width / 1,
                          child: TextField(
                            controller: txtAdd,
                            obscureText: false,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 10, top: 10, bottom: 10),
                                border: InputBorder.none,
                                hintText: 'Nhập địa chỉ',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 15)),
                            maxLines: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                  //end ô nhập địa chỉ
                  //Ô nhập mật khẩu
                  StatefulBuilder(builder: (context, passState) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Mật khẩu:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: Colors.black26,
                            ),
                            width: MediaQuery.of(context).size.width / 1,
                            child: TextField(
                              controller: txtPass,
                              obscureText: cpass,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 10, top: 10, bottom: 10),
                                border: InputBorder.none,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    passState(() {
                                      cpass = !cpass;
                                    });
                                  },
                                  child: Icon(
                                    cpass
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                ),
                                hintText:
                                    'Vui lòng nhập mật khẩu để lưu thông tin',
                                hintStyle: const TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                  //end nhập mật khẩu
                  //end sửa thông tin
                  //nút lưu
                  InkWell(
                    onTap: () async {
                      checkEmail = false;
                      for (var list in alluser) {
                        if (list.email.toString() == txtEmail.text &&
                            list.uid !=
                                FirebaseAuth.instance.currentUser?.uid) {
                          checkEmail = true;
                        }
                      }
                      if (txtPass.text.isEmpty) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        //Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Vui lòng nhập mật khẩu để lưu thông tin')));
                      } else if (checkEmail && user.email != txtEmail.text) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Email đã được dùng, vui lòng đổi sang email khác')));
                      } else if (txtPhone.text.length < 10) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Vui lòng nhập đúng định dạng số điện thoại (ĐÚNG 10 CHỮ SỐ)')));
                      } else {
                        var authuser = FirebaseAuth.instance.currentUser!;
                        var authResult =
                            await authuser.reauthenticateWithCredential(
                          EmailAuthProvider.credential(
                            email: user.email!,
                            password: txtPass.text,
                          ),
                        );
                        authResult.user!.updateEmail(txtEmail.text);
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(uid)
                            .update({
                          'email': txtEmail.text,
                          'fullname': txtFullname.text,
                          'number': txtPhone.text,
                          'address': txtAdd.text,
                        });
                        if (!context.mounted) return;
                        //FirebaseAuth.instance.currentUser!.updateEmail(txtEmail.text);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).clearSnackBars();
                        //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const Auth()), (route) => route.isCurrent);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Đổi thành công')));
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(20),
                      decoration:
                          const BoxDecoration(color: Colors.lightGreenAccent),
                      child: const Center(
                        child: Text(
                          'Lưu',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              );
              ;
            }
          },
        );
      },
    ));
  }
}
