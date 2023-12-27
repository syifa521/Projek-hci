import 'package:basomed/component/image_picker.dart';
import 'package:basomed/model/user_model.dart';
import 'package:basomed/pages/buku_disimpan_page.dart';
import 'package:basomed/pages/buku_sering_dicari_page.dart';
import 'package:basomed/pages/catatan_page.dart';
import 'package:basomed/pages/introduction_page.dart';
import 'package:basomed/pages/kategory_buku_page.dart';
import 'package:basomed/service/service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTab = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late UserModel _user;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _user = widget.user;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF7963B8),
        centerTitle: true,
        title: Text(
          "KOLEKSI",
          style: GoogleFonts.abhayaLibre(
              color: Colors.white, fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset("assets/images/search-icon.png"))
        ],
        leading: IconButton(
          icon: Image.asset("assets/images/drawer.png"),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        bottom: TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.white,
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
            onTap: (index) {
              setState(() {
                _selectedTab = index;
              });
            },
            tabs: [
              Tab(
                icon: Icon(
                  Icons.menu_book,
                  color: _selectedTab == 0
                      ? Colors.black
                      : Color.fromARGB(255, 69, 41, 144),
                ),
              ),
              Tab(
                icon: Image.asset(
                  "assets/images/most-book.png",
                  width: 50,
                  color: _selectedTab == 1
                      ? Colors.black
                      : Color.fromARGB(255, 69, 41, 144),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.bookmark_outline_outlined,
                  color: _selectedTab == 2
                      ? Colors.black
                      : Color.fromARGB(255, 69, 41, 144),
                ),
              ),
            ]),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                height: 190,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Color(0xFF7963B8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "${ApiService.baseUrl}/${_user.imageUrl}"),
                          radius: 50,
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  isDismissible: true,
                                  builder: (BuildContext context) =>
                                      ImagePickerDialog(onImageSelected:
                                          (FormData file) async {
                                        var result = await ApiService()
                                            .updateImage(
                                                _user.nisn ?? '', file);

                                        if (result != null) {
                                          setState(() {
                                            _user = result;
                                          });
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'Failed to upload image')));
                                        }
                                      }));
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 0),
                                maximumSize: Size(180, 30),
                                minimumSize: Size(100, 25),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                backgroundColor: Color(0xFF442F71)),
                            child: FittedBox(
                              child: Text(
                                "Update Image",
                                style: GoogleFonts.aBeeZee(fontSize: 16),
                              ),
                            ))
                      ],
                    ),
                    Text(
                      _user.name ?? '',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 15, color: Colors.white),
                    )
                  ],
                )),
            ListTile(
              leading: Image.asset("assets/images/newbie.png"),
              title: Text('Newbie'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              leading: Image.asset("assets/images/following.png"),
              title: Text('following'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              leading: Image.asset("assets/images/essay.png"),
              title: Text('essay'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              leading: Image.asset("assets/images/catatan.png"),
              title: Text('catatan'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CatatanPage(),
                    ));
              },
            ),
            Spacer(),
            ListTile(
              leading: Image.asset("assets/images/logout.png"),
              title: Text('Keluar'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IntroductionPage(),
                    ),
                    (route) => false);
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            KategoriBukuPage(),
            BukuSeringDicariPage(),
            BukuDisimpanPage()
          ]),
    );
  }
}
