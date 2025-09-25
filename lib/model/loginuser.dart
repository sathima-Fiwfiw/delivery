// lib/models/user_model.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String name;
  final String phoneNumber;
  // เพิ่ม field อื่นๆ ตามต้องการ เช่น address, profileImageUrl

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.phoneNumber, required String password, required String address, required String gps, required String role,
  });

  // ฟังก์ชันสำหรับแปลงข้อมูลเพื่อส่งไป Firestore
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone_number': phoneNumber,
      'role': 'customer', // กำหนดค่าเริ่มต้น
      'created_at': FieldValue.serverTimestamp(),
    };
  }
}