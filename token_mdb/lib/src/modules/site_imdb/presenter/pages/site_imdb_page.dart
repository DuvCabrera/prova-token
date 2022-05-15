import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:token_mdb/src/modules/core/core.dart';

class SiteImdbPage extends StatefulWidget {
  const SiteImdbPage({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  State<SiteImdbPage> createState() => _SiteImdbPageState();
}

class _SiteImdbPageState extends State<SiteImdbPage> {
  double _progress = 0;
  late InAppWebViewController inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarWidget(title: 'Imdb Page', haveBackButton: true),
            SingleChildScrollView(
              child: SizedBox(
                height: size.height * 0.9 - 24,
                child: Stack(children: [
                  InAppWebView(
                    initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
                    onWebViewCreated: (InAppWebViewController controller) {
                      inAppWebViewController = controller;
                    },
                    onProgressChanged:
                        (InAppWebViewController controller, int progress) {
                      setState(() {
                        _progress = progress / 100;
                      });
                    },
                  ),
                  _progress < 1
                      ? SizedBox(
                          height: 3,
                          child: LinearProgressIndicator(
                            value: _progress,
                            backgroundColor: Colors.amber,
                          ),
                        )
                      : const SizedBox(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
