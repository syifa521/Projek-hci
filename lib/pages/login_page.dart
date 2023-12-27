import 'package:basomed/model/user_model.dart';
import 'package:basomed/pages/forgot_password_page.dart';
import 'package:basomed/pages/home_page.dart';
import 'package:basomed/pages/register_page.dart';
import 'package:basomed/service/service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nisnController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo2.png", scale: 0.8),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(10)),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "NISN",
                            style: GoogleFonts.abhayaLibre(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ),
                          TextFormField(
                            controller: nisnController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'NISN is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 17),
                          Text(
                            "Password",
                            style: GoogleFonts.abhayaLibre(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPasswordPage(),
                                  ));
                            },
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                "Forgot Password ?",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                const SizedBox(height: 54),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              maximumSize:
                                  Size(MediaQuery.of(context).size.width, 60),
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 45),
                              backgroundColor: Color(0xFFD299EC)),
                          child: Text(
                            "Kembali",
                            style: GoogleFonts.aBeeZee(fontSize: 16),
                          )),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              if (_formKey.currentState!.validate()) {
                                UserModel? user = await ApiService().loginUser(
                                    nisnController.text.trim(),
                                    passwordController.text);
                                if (user != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Success')));
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(user: user),
                                    ),
                                    (route) => false,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Invalid Nisn Or Password')));
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 0),
                                maximumSize:
                                    Size(MediaQuery.of(context).size.width, 60),
                                minimumSize:
                                    Size(MediaQuery.of(context).size.width, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                backgroundColor: Color(0xFF442F71)),
                            child: Text(
                              "Lanjutkan",
                              style: GoogleFonts.aBeeZee(fontSize: 16),
                            )))
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              top: 40,
              left: -10,
              child: Image.asset("assets/images/book-left.png")),
          Positioned(
              top: 40,
              right: -10,
              child: Image.asset("assets/images/book-right.png")),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        top:
                            BorderSide(color: Colors.black.withOpacity(0.27)))),
                height: 60,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ));
                    },
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Belum punya akun ? ",
                          style: GoogleFonts.adamina(
                              fontSize: 12, color: Colors.black)),
                      TextSpan(
                          text: "Daftar.",
                          style: GoogleFonts.adamina(
                              fontSize: 12, color: Color(0xFF7963B8))),
                    ])),
                  ),
                ),
              )),
        ],
      )),
    );
  }
}
