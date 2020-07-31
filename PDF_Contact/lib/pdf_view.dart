import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

//library painter;
class Viewer extends StatefulWidget {
  @override
  _ViewerState createState() => _ViewerState();
}

class _ViewerState extends State<Viewer> {
  //relocate the file;
  String pdf = "files/view.pdf";
  PDFDocument _doc;
  bool _loading;
  @override
  void initState() {
    _viewPdf();
    super.initState();
  }

  _viewPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset(pdf);
    setState(() {
      _doc = doc;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? (Center(
                child: CircularProgressIndicator(),
              ))
            : PDFViewer(document: _doc),
      ),
    );
  }
}
