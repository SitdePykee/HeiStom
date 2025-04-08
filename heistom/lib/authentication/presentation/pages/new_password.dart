import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 82),
            Text(
              'Tạo mật khẩu mới',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 36),
            _passwordTextField(passwordController: _passwordController),
            SizedBox(height: 24),
            _confirmPasswordTextField(
                confirmPasswordController: _confirmPasswordController),
            SizedBox(height: 24),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 48,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Color(0xff18ACFE),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Lưu lại',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _passwordTextField extends StatelessWidget {
  final TextEditingController passwordController;

  const _passwordTextField({required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password cannot be blank';
          }
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        },
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Nhập mật khẩu mới',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 14) + EdgeInsets.only(left: 16),
        ),
      ),
    );
  }
}

class _confirmPasswordTextField extends StatelessWidget {
  final TextEditingController confirmPasswordController;

  const _confirmPasswordTextField({
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password cannot be blank';
          }
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          if (value != confirmPasswordController.text) {
            return 'Password does not match';
          }
          return null;
        },
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Nhập lại mật khẩu mới',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 14) + EdgeInsets.only(left: 16),
        ),
      ),
    );
  }
}
