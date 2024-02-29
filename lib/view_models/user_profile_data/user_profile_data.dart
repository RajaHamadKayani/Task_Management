import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataService {
  static String? _uid;
  static String? _userEmail;
  static String? _userName;
  static String? _userPassword;

  static Future<void> initUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    _uid = user?.uid;

    if (_uid != null) {
      try {
        // Assuming you have a 'users' collection in Firestore
        DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(_uid)
                .get();

        if (documentSnapshot.exists) {
          // Access user data
          Map<String, dynamic> userData = documentSnapshot.data()!;
          _userEmail = userData['email'];
          _userName = userData['name'];
          _userPassword = userData['password'];

          // Access other fields as needed
        } else {
          print('User does not exist in Firestore');
        }
      } catch (e) {
        print('Error retrieving user data: $e');
      }
    }
  }

  static String? get uid => _uid;
  static String? get userEmail => _userEmail;
  static String? get userName => _userName;
  static String? get userPassword => _userPassword;
}
