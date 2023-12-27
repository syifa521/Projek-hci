import 'package:basomed/model/user_model.dart';
import 'package:basomed/service/service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nisnController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: SizedBox.shrink(),
        backgroundColor: Color(0xFF7963B8),
        centerTitle: true,
        title: Text(
          "Registrasi",
          style: GoogleFonts.abhayaLibre(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                          "Nama",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                        TextFormField(
                          controller: namaController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Nama tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 17),
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
                              return 'NISN tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 17),
                        Text(
                          "EMAIL",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email tidak boleh kosong';
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
                              return 'Password tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 17),
                        Text(
                          "Konfirmasi Password",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                        TextFormField(
                          controller: passwordConfirmController,
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
                              return 'Konfirmasi Password tidak boleh kosong';
                            } else if (passwordController.text !=
                                passwordConfirmController.text) {
                              return 'Wrong Password !';
                            }
                            return null;
                          },
                        ),
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
                            if (_formKey.currentState!.validate()) {
                              UserModel? user = await ApiService().register(
                                  nisnController.text.trim(),
                                  namaController.text,
                                  "https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8",
                                  emailController.text,
                                  passwordController.text);
                              if (user != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Success')));
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Something Error')));
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
