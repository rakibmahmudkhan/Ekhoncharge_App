import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/charger_box_controller.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/views/charger_connect_message_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> with TickerProviderStateMixin {
  final GlobalKey _qrKey = GlobalKey();
  QRViewController? _controller;
  AnimationController? _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return Scaffold(
        body: SafeArea(
            child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          backgroundColor: Colors.transparent,
          title: Text(
            'Scan Charger QR-Code',
            style: logic.isDarkTheme
                ? eDarkMediumTitleStyleSTL
                : eLightMediumTitleStyleSTL,
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: FutureBuilder(
                future: Future.delayed(const Duration(milliseconds: 500)),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return QRView(
                      key: _qrKey,
                      onQRViewCreated: _onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                          borderColor: Colors.lightBlueAccent,
                          borderRadius: 10.0,
                          borderLength: 25.0,
                          borderWidth: 7.0,
                          cutOutSize:
                              (MediaQuery.of(context).size.width < 400 ||
                                      MediaQuery.of(context).size.height < 400)
                                  ? double.infinity
                                  : double.infinity),
                    );
                  }
                  return Container();
                },
              )),
          actions: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 85,
                width: double.maxFinite,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await _controller?.toggleFlash();
                            setState(() {});
                          },
                          child: FutureBuilder(
                            future: _controller?.getFlashStatus(),
                            builder: (context, snapshot) {
                              return Text(
                                'Flash',
                                style: logic.isDarkTheme
                                    ? eDarkSmallTitleStyleSTL
                                    : eLightSmallTitleStyleSTL,
                              );
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await _controller?.flipCamera();
                            setState(() {});
                          },
                          child: FutureBuilder(
                            future: _controller?.getCameraInfo(),
                            builder: (context, snapshot) {
                              if (snapshot.data != null) {
                                return Text(
                                  'Camera facing ',
                                  style: logic.isDarkTheme
                                      ? eDarkSmallTitleStyleSTL
                                      : eLightSmallTitleStyleSTL,
                                );
                              } else {
                                return const Text('loading');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await _controller?.resumeCamera();
                      },
                      child: Card(
                        color: Colors.white,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0)),
                            height: 30,
                            width: 230,
                            child: const Center(
                              child: Text(
                                'Scan',
                                style: TextStyle(color: Colors.black),
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      );
    });
  }

  Future<void> _onQRViewCreated(QRViewController controller) async {
    setState(() {
      _controller = controller;
      _animController!.forward();
    });
    _controller?.scannedDataStream.listen((scanData) async {
      Navigator.of(context).pop();

      Get.find<ChargerBoxController>().qrCode = scanData.code ?? '';
      Get.to(() => const ChargerConnectMessagePage());
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
    _animController!.dispose();
  }
}
