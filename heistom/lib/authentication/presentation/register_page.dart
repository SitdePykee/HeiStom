import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            Text(
              'Đăng ký tài khoản mới',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 36),
            Form(
                child: Column(
              children: [
                _usernameTextField(usernameController: usernameController),
                SizedBox(height: 16),
                _emailTextField(emailController: emailController),
                SizedBox(height: 16),
                _passwordTextField(
                  passwordController: passwordController,
                ),
                SizedBox(height: 16),
                _confirmPasswordTextField(
                  confirmPasswordController: confirmPasswordController,
                ),
                SizedBox(height: 24),
                Wrap(
                  children: [
                    Text(
                        'Khi bạn nhấn vào đăng ký la có nghĩa bạn đồng ý với '),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'các điều khoản và điều kiện sử dụng của chúng tôi',
                        style: TextStyle(
                          color: Color(0xff0163E0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
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
                        'Đăng ký',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bạn chưa có tài khoản?'),
                    TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(EdgeInsets.zero),
                        ),
                        onPressed: () {
                          Get.to(() => RegisterPage());
                        },
                        child: Text(
                          'Đăng ký',
                          style: TextStyle(color: Color(0xff0163E0)),
                        )),
                  ],
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Color(0xffE3E5E7),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Hoặc'),
                      ),
                      Expanded(
                        child: Divider(
                          color: Color(0xffE3E5E7),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/icons/apple.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/icons/google.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/icons/facebook.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class _usernameTextField extends StatelessWidget {
  final TextEditingController usernameController;

  const _usernameTextField({required this.usernameController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: usernameController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Username cannot be blank';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: 'Username',
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
          hintText: 'Nhập mật khẩu',
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
          hintText: 'Nhập lại mật khẩu',
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
          hintText: 'Email',
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
