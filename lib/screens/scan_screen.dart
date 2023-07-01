import 'package:cyberwatch_mobile/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:
            TextBold(text: 'VERIFICATION', fontSize: 18, color: Colors.white),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // _authenticateWithBiometrics();
              },
              child: Image.asset(
                'assets/images/fingerprint.png',
                height: 250,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextRegular(
              text: 'Scan biometrics here',
              fontSize: 14,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
