import 'package:ekhoncharge/settings/colors.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeViewPage extends StatefulWidget {
  const QRCodeViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRCodeViewPageState();
}

class _QRCodeViewPageState extends State<QRCodeViewPage> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QRView(
          overlay: QrScannerOverlayShape(
            borderColor: eMPrimaryCLR,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: 400,
          ),
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.stopCamera();
      controller.dispose();
      Navigator.pop(context,scanData.code ?? '');
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
