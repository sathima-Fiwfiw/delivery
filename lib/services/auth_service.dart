// lib/services/auth_service.dart
//จัดการเรื่องยืนยันตัวตน
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ฟังก์ชันสำหรับสมัครสมาชิกด้วย Email และ Password
  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      // จัดการกับ Error ต่างๆ เช่น อีเมลซ้ำ, รหัสผ่านสั้นไป
      print('Firebase Auth Exception: ${e.message}');
      return null;
    }
  }

  // (ใส่ฟังก์ชัน Login, Logout ที่นี่ในอนาคต)
}