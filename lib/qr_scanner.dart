import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final GlobalKey _globalKey = GlobalKey();
  QRViewController? controller;
  Barcode? result;
  void qr(QRViewController controller){
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        result = event;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[300],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              width: 300,
              child: QRView(
                key: _globalKey,
                onQRViewCreated: qr,
              ),
            ),
            Center(
              child: (result != null) ? Text('${result!.code}'):Text('Scan a code'),
              )
          ],
        ),
      ),
    );
  }
}