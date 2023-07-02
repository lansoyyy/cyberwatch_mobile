import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberwatch_mobile/screens/auth/landing_screen.dart';
import 'package:cyberwatch_mobile/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<DrawerWidget> {
  final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: userData,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Drawer();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Drawer();
          }
          dynamic data = snapshot.data;
          return SizedBox(
            width: 220,
            child: Drawer(
              child: ListView(
                padding: const EdgeInsets.only(top: 0),
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/background.jpg',
                          ),
                          fit: BoxFit.cover,
                          opacity: 150),
                    ),
                    accountEmail: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextRegular(
                            text: data['contactNumber'],
                            fontSize: 14,
                            color: Colors.white),
                        const SizedBox(
                          height: 5,
                        ),
                        TextRegular(
                            text: 'Police Officer',
                            fontSize: 12,
                            color: Colors.white),
                      ],
                    ),
                    accountName: TextBold(
                      text: data['name'],
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    currentAccountPicture: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: CircleAvatar(
                        minRadius: 50,
                        maxRadius: 50,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                    ),
                  ),
                  ListTile(
                    title: TextBold(
                      text: 'Home',
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    },
                  ),
                  ListTile(
                    title: TextBold(
                      text: 'Logout',
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text(
                                  'Logout Confirmation',
                                  style: TextStyle(
                                      fontFamily: 'QBold',
                                      fontWeight: FontWeight.bold),
                                ),
                                content: const Text(
                                  'Are you sure you want to Logout?',
                                  style: TextStyle(fontFamily: 'QRegular'),
                                ),
                                actions: <Widget>[
                                  MaterialButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: const Text(
                                      'Close',
                                      style: TextStyle(
                                          fontFamily: 'QRegular',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () async {
                                      await FirebaseAuth.instance.signOut();
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LandingScreen()));
                                    },
                                    child: const Text(
                                      'Continue',
                                      style: TextStyle(
                                          fontFamily: 'QRegular',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ));
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
