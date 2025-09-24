import 'package:delivery/rider/HomePageRider.dart';
import 'package:delivery/rider/registerRider.dart';
import 'package:delivery/user/login_user.dart';
import 'package:flutter/material.dart';


class LoginRiderScreen extends StatefulWidget {
  const LoginRiderScreen({super.key});

  @override
  State<LoginRiderScreen> createState() => _LoginRiderScreenState();
}

class _LoginRiderScreenState extends State<LoginRiderScreen> {
  int selectedRole = 1; // เริ่มเป็นไรเดอร์
  bool obscure = true;

  final emailCtl = TextEditingController();
  final passCtl = TextEditingController();

  static const kYellow = Color(0xFFF0DB0C);
  static const kDarkCard = Color(0xFF4D4D4D);
  static const kTextBlack = Color(0xFF111111);
  static const kBlue = Color(0xFF2F47FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // หัวเหลือง
          Container(
            padding: const EdgeInsets.fromLTRB(16, 36, 16, 24),
            decoration: const BoxDecoration(
              color: kYellow,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(26),
                bottomRight: Radius.circular(26),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  'เข้าสู่ระบบ',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: kTextBlack,
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 🟡 ผู้ใช้ระบบ -> ไปหน้า LoginUserScreen
                    _rolePill(
                      label: 'ผู้ใช้ระบบ',
                      bg: Colors.white,
                      fg: kTextBlack,
                      onTap: () {
                        setState(() => selectedRole = 0);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginUserScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 14),
                    // ⚫ ไรเดอร์ (หน้าเดิม)
                    _rolePill(
                      label: 'ไรเดอร์',
                      bg: kDarkCard,
                      fg: kYellow,
                      onTap: () => setState(() => selectedRole = 1),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ฟอร์ม (กึ่งกลาง)
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 28),
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 320),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _inputBox(
                        controller: emailCtl,
                        hint: 'Email',
                        icon: Icons.person_rounded,
                      ),
                      const SizedBox(height: 18),
                      _inputBox(
                        controller: passCtl,
                        hint: 'Password',
                        icon: Icons.lock_rounded,
                        obscure: obscure,
                        suffix: InkWell(
                          onTap: () => setState(() => obscure = !obscure),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              obscure
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              size: 22,
                              color: Colors.black.withOpacity(.75),
                            ),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFFE1C700),
                            padding: EdgeInsets.zero,
                            textStyle: const TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          child: const Text('ลืมรหัสผ่าน?'),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // เข้าสู่ระบบ -> HomePageRider
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 190,
                          height: 46,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => HomePageRider(
                                    name: emailCtl.text.trim().isEmpty
                                        ? 'Tester'
                                        : emailCtl.text.trim(),
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kYellow,
                              foregroundColor: kTextBlack,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            child: const Text('เข้าสู่ระบบ'),
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // สมัครสมาชิก -> RegisterRider
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const RegisterRider(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: kBlue,
                            textStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          child: const Text('สมัครสมาชิก'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rolePill({
    required String label,
    required Color bg,
    required Color fg,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: 44,
      child: Material(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            alignment: Alignment.center,
            child: Text(
              label,
              style: TextStyle(
                color: fg,
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputBox({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    Widget? suffix,
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black.withOpacity(.7)),
        suffixIcon: suffix,
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(.55),
          fontSize: 14.5,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: kYellow, width: 1.4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: kYellow, width: 1.8),
        ),
      ),
      style: const TextStyle(fontSize: 14.5, color: kTextBlack),
    );
  }
}

