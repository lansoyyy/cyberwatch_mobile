import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addAccount(name, username, contactNumber) async {
  final docUser = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  final json = {
    'name': name,
    'username': username,
    'contactNumber': contactNumber,
    'id': docUser.id,
    'profilePicture': 'https://cdn-icons-png.flaticon.com/256/149/149071.png',
    'location': [
      {
        'lat': 0.00,
        'long': 0.00,
        'dateTime': DateTime.now(),
      }
    ]
  };

  await docUser.set(json);
}
