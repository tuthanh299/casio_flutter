import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  TextEditingController txtOldPass = TextEditingController();
  TextEditingController txtNewPass = TextEditingController();
  TextEditingController txtRePass = TextEditingController();
  double cochu = 18;
  bool oldPass = true;
  bool newPass = true;
  bool rePass = true;

  @override
  Widget build(BuildContext context) {
    RegExp passValid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

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
                      'ĐỔI MẬT KHẨU',
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
              //Ô nhập mk cũ
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mật khẩu cũ:',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.black26,
                      ),
                      width: MediaQuery.of(context).size.width / 1,
                      child: TextField(
                        controller: txtOldPass,
                        obscureText: oldPass,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 10),
                            border: InputBorder.none,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  oldPass = !oldPass;
                                });
                              },
                              child: Icon(
                                oldPass
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                            hintText: 'Nhập mật khẩu cũ',
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 15)),
                      ),
                    )
                  ],
                ),
              ),
              //end ô mk cũ
              //Ô nhập mk mới
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mật khẩu mới:',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.black26,
                      ),
                      width: MediaQuery.of(context).size.width / 1,
                      child: TextField(
                        controller: txtNewPass,
                        obscureText: newPass,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 10),
                            border: InputBorder.none,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  newPass = !newPass;
                                });
                              },
                              child: Icon(
                                newPass
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                            hintText: 'Nhập mật khẩu mới',
                            hintStyle: const TextStyle(
                                color: Colors.black, fontSize: 15)),
                      ),
                    )
                  ],
                ),
              ),
              //end ô mk mới
              //Ô nhập lại mk mới
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nhập lại mật khẩu mới:',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.black26,
                      ),
                      width: MediaQuery.of(context).size.width / 1,
                      child: TextField(
                        controller: txtRePass,
                        obscureText: rePass,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 10),
                            border: InputBorder.none,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  rePass = !rePass;
                                });
                              },
                              child: Icon(
                                rePass
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                            hintText: 'Nhập lại mật khẩu mới',
                            hintStyle: const TextStyle(
                                color: Colors.black, fontSize: 15)),
                      ),
                    )
                  ],
                ),
              ),
              //end ô nhập lại mật khẩu
              //end sửa thông tin
              //nút lưu
              InkWell(
                onTap: () async {
                  if (txtOldPass.text.isEmpty ||
                      txtNewPass.text.isEmpty ||
                      txtRePass.text.isEmpty) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Text('Vui lòng nhập đầy đủ các trường dữ liệu')));
                  } else if (txtNewPass.text.length < 8 &&
                      !passValid.hasMatch(txtNewPass.text.trim())) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Mật khẩu mới cần ít nhất 8 kí tự, chứa ít nhất 1 chữ cái viết hoa hoặc 1 kí tự đặc biệt')));
                  } else if (txtNewPass.text != txtRePass.text) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Mật khẩu không trùng nhau')));
                  } else {
                    var user = FirebaseAuth.instance.currentUser!;
                    var authResult = EmailAuthProvider.credential(
                      email: user.email!,
                      password: txtOldPass.text,
                    );
                    try {
                      user
                          .reauthenticateWithCredential(authResult)
                          .then((value) {
                        user.updatePassword(txtNewPass.text.trim()).then((_) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Đổi mật khẩu thành công')));
                          txtOldPass.clear();
                          txtNewPass.clear();
                          txtRePass.clear();
                        });
                      });
                    } on FirebaseAuthException catch (e) {
                      switch (e.code) {
                        case 'wrong-password':
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Nhập sai mật khẩu')));
                            break;
                          }
                        case 'invalid-email':
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Nhập sai email')));
                            break;
                          }
                        case 'user-not-found':
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Không tìm thấy email/user')));
                            break;
                          }
                      }
                    }
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
          )),
        ],
      ),
    );
  }
}
