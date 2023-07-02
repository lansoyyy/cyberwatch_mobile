import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberwatch_mobile/screens/home_screen.dart';
import 'package:cyberwatch_mobile/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:local_auth/local_auth.dart';

class ScanScreen extends StatefulWidget {
  final DateTime dateTime;

  const ScanScreen({super.key, required this.dateTime});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final LocalAuthentication auth = LocalAuthentication();

  String authorized = 'Not Authorized';
  bool isAuthenticating = false;
  bool authenticated = false;

  Future<void> authenticateWithBiometrics() async {
    // only Biometrics

    try {
      setState(() {
        isAuthenticating = true;
        authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {
        isAuthenticating = false;
        authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        isAuthenticating = false;
        authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      authorized = message;
    });

    if (authenticated) {
      Geolocator.getCurrentPosition().then((position) async {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'location': FieldValue.arrayUnion([
            {
              'lat': position.latitude,
              'long': position.longitude,
              'dateTime': widget.dateTime,
            }
          ]),
        });
      }).catchError((error) {
        print('Error getting location: $error');
      });
      Fluttertoast.showToast(msg: 'Fingerprint scanned succesfully!');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      Fluttertoast.showToast(msg: 'Fingerprint scanned unsuccesfully!');
    }
    print(authenticated);
  }

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
                authenticateWithBiometrics();
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
              text: 'Scan fingerprint here',
              fontSize: 14,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
