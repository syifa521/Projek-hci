import 'package:basomed/model/book_model.dart';
import 'package:basomed/pages/book_view_page.dart';
import 'package:basomed/service/service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KategoriBukuTabsPage extends StatefulWidget {
  final int tab;
  const KategoriBukuTabsPage({super.key, required this.tab});

  @override
  State<KategoriBukuTabsPage> createState() => _KategoriBukuTabsPageState();
}

class _KategoriBukuTabsPageState extends State<KategoriBukuTabsPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  List<BookModel> ipa = [];
  List<BookModel> ips = [];

  Future getBooks() async {
    List<BookModel> booksIpa = await ApiService().getBooks("IPA") ?? [];
    List<BookModel> booksIps = await ApiService().getBooks("IPS") ?? [];
    setState(() {
      ipa = booksIpa;
      ips = booksIps;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.wait([getBooks()]);
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabController.animateTo(widget.tab);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7963B8),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          "Kategori Buku",
          style: GoogleFonts.abhayaLibre(
              color: Colors.white, fontWeight: FontWeight.w800),
        ),
        bottom: TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.grey,
            // colo
            labelPadding: const EdgeInsets.all(8),
            indicatorSize: TabBarIndicatorSize.tab,
            splashBorderRadius: BorderRadius.circular(8),
            indicator: UnderlineTabIndicator(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                width: 4,
                color: Colors.black,
              ),
            ),
            tabs: [Text("IPA"), Text("IPS")]),
      ),
      body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: ipa.length,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookViewPage(
                                title:
                                    ipa[index].name?.replaceAll('.png', '') ??
                                        '',
                                path: ipa[index].path ??
                                    'assets/pdf/XII_Biologi.pdf')));
                  },
                  child: Image.asset("assets/images/${ipa[index].image}",
                      fit: BoxFit.cover)),
            ),
            GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: ips.length,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookViewPage(
                                title:
                                    ips[index].name?.replaceAll('.png', '') ??
                                        '',
                                path: ips[index].path ??
                                    'assets/pdf/XII_Biologi.pdf')));
                  },
                  child: Image.asset("assets/images/${ips[index].image}",
                      fit: BoxFit.cover)),
            ),
          ]),
    );
  }
}
