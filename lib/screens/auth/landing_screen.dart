import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/text_widget.dart';

import 'dart:io';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late String id = '';

  late String password = '';

  late String newId = '';

  late String newPassword = '';

  late String confirmPassword = '';

  late String adminPassword = '';

  String name = '';

  List<String> dropdownItems = [
    'BSIT',
    'BSIS',
    'BS IND TECH (ARCHITECTURAL DRAFTING)',
    'BS IND TECH (AUTOMOTIVE)',
    'BS IND TECH (COMPUTER TECHNOLOGY)',
    'BS IND TECH (ELECTRICAL TECHNOLOGY)',
    'BS IND TECH (ELECTRONICS TECHNOLOGY)',
    'BS IND TECH (FOOD TRADES TECHNOLOGY)',
    'BS IND TECH (MECHANICAL TECHNOLOGY)',
    'BTVTED (ELECTRICAL TECHNOLOGY)',
    'BTVTED (ELECTRONICS TECHNOLOGY)',
    'BSCPE',
    'BSECE',
  ];

  String selectedCOurse = 'BSIT';

  List<String> dropdownYears = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
  ];
  String selectedYear = '1st Year';

  late String fileName = '';

  late File imageFile;

  late String imageURL = '';

  String section = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),
              const SizedBox(
                height: 10,
              ),
              TextBold(text: 'Cyberwatch', fontSize: 32, color: Colors.white),
              const SizedBox(
                height: 10,
              ),
              TextRegular(
                  text: 'Philippine National Police - Cagayan De Oro City',
                  fontSize: 12,
                  color: Colors.white),
              const SizedBox(
                height: 75,
              ),
              MaterialButton(
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minWidth: 250,
                color: Colors.white,
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => const SignupPage()));
                },
                child: TextBold(text: 'LOGIN', fontSize: 18, color: primary),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minWidth: 250,
                color: Colors.white,
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => const SignupPage()));
                },
                child: TextBold(text: 'REGISTER', fontSize: 18, color: primary),
              ),
              const SizedBox(
                height: 20,
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     border: Border.all(color: Colors.white),
              //   ),
              //   child: MaterialButton(
              //       height: 50,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       minWidth: 250,
              //       onPressed: () {
              //         // Navigator.of(context).push(MaterialPageRoute(
              //         //     builder: (context) => const LoginPage()));
              //       },
              //       child: TextBold(
              //           text: 'CONTINUE AS ADMIN',
              //           fontSize: 12,
              //           color: Colors.white)),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginDialog(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: primary, borderRadius: BorderRadius.circular(5)),
        height: 320,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBold(text: 'LOGIN', fontSize: 18, color: Colors.white),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  onChanged: ((value) {
                    id = value;
                  }),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Enter your STUDENT ID',
                      labelStyle: TextStyle(
                          color: Colors.white, fontFamily: 'QRegular')),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  obscureText: true,
                  onChanged: ((value) {
                    password = value;
                  }),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Enter your Password',
                      labelStyle: TextStyle(
                          color: Colors.white, fontFamily: 'QRegular')),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: MaterialButton(
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minWidth: 250,
                  color: Colors.white,
                  onPressed: () async {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const SignupPage()));
                  },
                  child: TextBold(text: 'LOGIN', fontSize: 18, color: primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
