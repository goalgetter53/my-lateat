import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppAuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final SharedPreferences _prefs;
  static const String _emailKey = 'remembered_email';

  User? get currentUser => _auth.currentUser;
  bool get isAuthenticated => currentUser != null;

  AppAuthProvider(this._prefs);

  Future<void> signIn(String email, String password, {bool rememberMe = false}) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    
    if (rememberMe) {
      await _prefs.setString(_emailKey, email);
    } else {
      await _prefs.remove(_emailKey);
    }
    
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential);
    notifyListeners();
  }

  Future<void> signOut() async {
    await Future.wait([
      _auth.signOut(),
      _googleSignIn.signOut(),
    ]);
    notifyListeners();
  }

  Future<String?> getRememberedEmail() async {
    return _prefs.getString(_emailKey);
  }
}