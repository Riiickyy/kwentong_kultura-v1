import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class AlamatngpinyaBasa extends StatefulWidget {
  const AlamatngpinyaBasa({super.key});

  @override
  State<AlamatngpinyaBasa> createState() => _AlamatngpinyaBasaState();
}

class _AlamatngpinyaBasaState extends State<AlamatngpinyaBasa> {
  late PdfControllerPinch _pinchController;

  int totalPages = 0;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    _pinchController = PdfControllerPinch(
      document: PdfDocument.openAsset("assets/pdfs/Pinya.pdf"),
    );
  }

  @override
  void dispose() {
    _pinchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Alamat ng Pinya",
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFFACDC94),
        elevation: 6,
        shadowColor: Colors.black54,
      ),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  _pinchController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.bounceIn,
                  );
                },
                icon: const Icon(Icons.arrow_back),
              ),
              Text(
                'Pahina: $currentPage / $totalPages',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                ),
              ),
              IconButton(
                onPressed: () {
                  _pinchController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.bounceIn,
                  );
                },
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
          Expanded(
            child: PdfViewPinch(
              scrollDirection: Axis.vertical,
              controller: _pinchController,
              onDocumentLoaded: (doc) {
                setState(() {
                  totalPages = doc.pagesCount;
                });
              },
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
