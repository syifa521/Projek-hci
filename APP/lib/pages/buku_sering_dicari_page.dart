import 'package:basomed/model/book_model.dart';
import 'package:basomed/pages/book_view_page.dart';
import 'package:basomed/service/service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BukuSeringDicariPage extends StatefulWidget {
  const BukuSeringDicariPage({super.key});

  @override
  State<BukuSeringDicariPage> createState() => BukuSeringDicariPageState();
}

class BukuSeringDicariPageState extends State<BukuSeringDicariPage> {

  List<BookModel> buku = [];

  @override
  void initState() {
    super.initState();
    Future.wait([getBooks()]);
  }

  Future getBooks() async {
    List<BookModel> books = await ApiService().getBooks(null) ?? [];
    setState(() {
      buku = books;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: Color(0xFFD9D9D9),
            child: Text(
              "Buku Yang Sering Dicari",
              style: GoogleFonts.abhayaLibre(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: buku.length,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookViewPage(
                            title: buku[index].name?.replaceAll('.png', '') ?? '',
                            path: buku[index].path ?? 'assets/pdf/XII_Biologi.pdf'),
                      ));
                },
                child: Image.asset("assets/images/${buku[index].image}",
                    fit: BoxFit.cover)),
          ),
        ),
      ],
    ));
  }
}
