import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';

class BookViewPage extends StatefulWidget {
  final String path;
  final String title;

  const BookViewPage({super.key, required this.path, required this.title});

  @override
  State<BookViewPage> createState() => _BookViewPageState();
}

class _BookViewPageState extends State<BookViewPage> {
  final pdfController = PdfViewerController();

  bool isReady = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7963B8),
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          SfPdfViewer.asset(
            widget.path,
            controller: pdfController,
          ),
        ],
      ),
    );
  }
}
