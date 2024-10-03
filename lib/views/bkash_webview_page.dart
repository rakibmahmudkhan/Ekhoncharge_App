import 'package:ekhoncharge/settings/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BkashWebViewPage extends StatefulWidget {
  final String bkashURL;
  final String successCallbackURL;
  final String failureCallbackURL;
  final String cancelledCallbackURL;

  const BkashWebViewPage({
    Key? key,
    required this.bkashURL,
    required this.successCallbackURL,
    required this.failureCallbackURL,
    required this.cancelledCallbackURL,
  }) : super(key: key);

  @override
  State<BkashWebViewPage> createState() => _BkashWebViewPageState();
}

class _BkashWebViewPageState extends State<BkashWebViewPage> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            Get.back(result: 'failed');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith("https://www.bkash.com/")) {
              return NavigationDecision.navigate;
            }
            if (request.url.startsWith(widget.successCallbackURL)) {
              Get.back(result: 'success');
            } else if (request.url.startsWith(widget.failureCallbackURL)) {
              Get.back(result: 'failed');
            } else if (request.url.startsWith(widget.cancelledCallbackURL)) {
              Get.back(result: 'canceled');
            }
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.bkashURL));
  }

  @override
  void dispose() {
    _webViewController.clearCache();
    _webViewController.clearLocalStorage();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        if (await _webViewController.canGoBack()) {
          await _webViewController.goBack();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor:ePinkColor,
            automaticallyImplyLeading: true,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: eWhiteCLR,
                onPressed: () {
                  Navigator.of(context).pop('canceled');
                }),
            title: const Text('bKash Checkout')),
        body: WebViewWidget(controller: _webViewController),
      ),
    );
  }
}
