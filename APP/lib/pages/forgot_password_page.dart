import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();
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
                const SizedBox(height: 180),
                Container(
                    width: double.infinity,
                    height: 90,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                        color: Color(0xFF7963B8),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Center(
                      child: Text(
                        "Lupa Password",
                        style: GoogleFonts.abhayaLibre(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    )),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 32),
                            child: FittedBox(
                              child: Text(
                                "Masukan Alamat Email Anda Untuk Penyetingan Ulang",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                          ),
                          Text(
                            "Email",
                            style: GoogleFonts.abhayaLibre(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
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
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                        ),
                                        maximumSize: Size(
                                            MediaQuery.of(context).size.width,
                                            60),
                                        minimumSize: Size(
                                            MediaQuery.of(context).size.width,
                                            45),
                                        backgroundColor: Color(0xFFD299EC)),
                                    child: Text(
                                      "Kembali",
                                      style: GoogleFonts.aBeeZee(fontSize: 16),
                                    )),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          Navigator.pop(context);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 14, horizontal: 0),
                                          maximumSize: Size(
                                              MediaQuery.of(context).size.width,
                                              60),
                                          minimumSize: Size(
                                              MediaQuery.of(context).size.width,
                                              45),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                          ),
                                          backgroundColor: Color(0xFF442F71)),
                                      child: Text(
                                        "Lanjutkan",
                                        style:
                                            GoogleFonts.aBeeZee(fontSize: 16),
                                      )))
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          Positioned(
              top: 40,
              left: 0,
              child: Image.asset("assets/images/book-left.png")),
          Positioned(
              top: 40,
              right: 0,
              child: Image.asset("assets/images/book-right.png")),
        ],
      )),
    );
  }
}
