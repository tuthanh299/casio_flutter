import 'package:flutter/material.dart'; 
import 'package:casio_flutter/screens/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool cpass = true;
  bool crepass = true;
  TextEditingController txtMail = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  TextEditingController txtrePass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //logo
            Center(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/imgs/logo.png'),
                  width: 100,
                  height: 100,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'G-SHOCK',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      '40th Anniversary',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ],
                )
              ],
            )),
            //end logo
            SizedBox(height: MediaQuery.of(context).size.height / 25),
            //chữ đăng kí
            const Text(
              'ĐĂNG KÝ',
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
            //end chữ đăng nhập
            //Ô nhập mail
            //Ô nhập mail
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tài khoản:',
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
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    controller: txtMail,
                    obscureText: false,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nhập tài khoản',
                        hintStyle:
                            TextStyle(color: Colors.black, fontSize: 12)),
                  ),
                )
              ],
            ),
            //end ô nhập mail
            const SizedBox(
              height: 20,
            ),
            //ô nhập pass
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.black26,
                  ),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    controller: txtPass,
                    obscureText: false,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              cpass = !cpass;
                            });
                          },
                          child: Icon(
                            cpass ? Icons.visibility : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                        hintText: 'Nhập mật khẩu',
                        hintStyle:
                            const TextStyle(color: Colors.black, fontSize: 12)),
                  ),
                )
              ],
            ),
            //end ô nhập pass
            const SizedBox(
              height: 20,
            ),
            //ô nhập repass
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Xác nhận mật khẩu:',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.black26,
                  ),
                  child: TextField(
                    controller: txtPass,
                    obscureText: false,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              crepass = !crepass;
                            });
                          },
                          child: Icon(
                            crepass ? Icons.visibility : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                        hintText: 'Nhập lại mật khẩu',
                        hintStyle:
                            const TextStyle(color: Colors.black, fontSize: 12)),
                  ),
                )
              ],
            ),
            //end ô nhập repass
            SizedBox(height: MediaQuery.of(context).size.height / 8),
            //nút đăng kí
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const Login()),
                    (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  backgroundColor: Colors.lightGreenAccent),
              child: const Text(
                'ĐĂNG KÝ',
                style: TextStyle(color: Colors.black),
              ),
            ),
            //end nút đăng kí
            //nút chuyển trang
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Bạn đã có tài khoản?, '),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const Login()),
                        (route) => route.isFirst);
                  },
                  child: const Text('Đăng nhập ngay!',
                      style: TextStyle(color: Colors.blue)),
                )
              ],
            ),
            //end nút chuyển trang
          ],
        ),
      ),
    ));
  }
}
