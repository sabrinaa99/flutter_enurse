import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late WebViewController controller;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: 'https://www.robopreneur.com/',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                this.controller = controller;
              },
              onPageStarted: (url) {
                print('page Started : $url');
                Future.delayed(const Duration(milliseconds: 1000), () {
                  setState(() {
                    isLoading = false;
                  });
                });
              },
              onPageFinished: (url) {
                print('finished');
                controller.runJavascript(
                    "document.getElementsByTagName('header')[0].style.display='none'");
                controller.runJavascript(
                    "document.getElementsByTagName('footer')[0].style.display='none'");
              },
            ),
            if (isLoading)
              const Center(
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        ),
      ),

    );
  }
}