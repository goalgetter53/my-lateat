import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/user_model.dart' as app;

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  // Singleton pattern
  static final AuthRepository _instance = AuthRepository._internal();
  factory AuthRepository() => _instance;
  AuthRepository._internal();

  Future<void> initialize() async {
    // No initialization needed for Firestore
  }

  Future<app.User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final firebaseUser = authResult.user;

      if (firebaseUser != null) {
        // Check if user already exists in Firestore
        final userDoc = await _firestore.collection('users')
            .doc(firebaseUser.uid)
            .get();

        if (userDoc.exists) {
          return app.User.fromMap(userDoc.id, userDoc.data()!);
        }

        // Create new user if doesn't exist
        final user = app.User(
          id: firebaseUser.uid,
          email: firebaseUser.email!,
          displayName: firebaseUser.displayName,
          photoUrl: firebaseUser.photoURL,
          uid: firebaseUser.uid,
          provider: 'google',
          createdAt: DateTime.now(),
        );

        await _firestore.collection('users')
            .doc(user.id)
            .set(user.toMap());

        return user;
      }
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
    return null;
  }

  Future<app.User?> getCurrentUser() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      final userDoc = await _firestore.collection('users')
          .doc(firebaseUser.uid)
          .get();
          
      if (userDoc.exists) {
        return app.User.fromMap(userDoc.id, userDoc.data()!);
      }
    }
    return null;
  }

  Future<void> signOut() async {
    await Future.wait([
      _auth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  Future<void> updateUserCountry(String uid, String country) async {
    await _firestore.collection('users')
        .doc(uid)
        .update({'selectedCountry': country});
  }
}