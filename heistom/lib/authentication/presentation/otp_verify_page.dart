import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:heistom/authentication/presentation/new_password_page.dart';

class OtpVerifyPage extends StatelessWidget {
  final String email;

  OtpVerifyPage({super.key, required this.email});

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
      body: Column(
        children: [
          SizedBox(height: 82),
          Text(
            'Xác nhận tài khoản',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8),
          Text(
            'Chúng tôi đã gửi OTP gồm 6 số tới email',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Text(email, style: TextStyle(fontSize: 14, color: Color(0xff0163E0))),
          const SizedBox(height: 30),
          OtpTextField(
            numberOfFields: 6,
            borderColor: Color(0xFF512DA8),
            showFieldAsBox: true,
            onCodeChanged: (String code) {},
            onSubmit: (String verificationCode) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  });
            },
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Bạn không nhận được mã OTP?'),
              SizedBox(width: 5),
              TextButton(
                style: ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                ),
                onPressed: () {},
                child: Text('Gửi lại mã',
                    style: TextStyle(color: Color(0xff0163E0))),
              )
            ],
          ),
          SizedBox(height: 24),
          InkWell(
            onTap: () {
              Get.to(() => NewPasswordPage());
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
        ],
      ),
    );
  }
}
