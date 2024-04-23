import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Đăng xuất
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception("Đăng xuất thất bại: $e");
    }
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
