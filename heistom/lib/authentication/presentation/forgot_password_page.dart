import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/authentication/presentation/pages/otp_verify.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

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
                'Quên mật khẩu',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 36),
              _emailTextField(
                emailController: _emailController,
              ),
              SizedBox(height: 24),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Get.to(() => OtpVerifyPage(email: _emailController.text));
                  }
                },
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
                      'Tiếp tục',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Bạn đã nhớ lại mật khẩu?'),
                  SizedBox(width: 5),
                  TextButton(
                    style: ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Đăng nhập',
                        style: TextStyle(color: Color(0xff0163E0))),
                  )
                ],
              )
            ],
          )),
    );
  }
}

class _emailTextField extends StatelessWidget {
  final TextEditingController emailController;

  _emailTextField({required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: emailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email cannot be blank';
          }
          if (!RegExp(r'^[^@]+@gmail\.com$').hasMatch(value)) {
            return 'Malformed email';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: 'Nhập email bạn đã đăng ký',
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
