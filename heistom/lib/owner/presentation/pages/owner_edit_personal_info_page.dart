import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/common/global_controller.dart';
import 'dart:io';

class OwnerEditPersonalInfoPage extends StatelessWidget {
  OwnerEditPersonalInfoPage({super.key});

  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: (globalController.user.avatar != null &&
                              globalController.user.avatar!.isNotEmpty)
                          ? FileImage(File(globalController.user.avatar!))
                          : null,
                      child: (globalController.user.avatar == null ||
                              globalController.user.avatar!.isEmpty)
                          ? const Icon(Icons.person, size: 64)
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Colors.grey,
                                spreadRadius: 1,
                              )
                            ]),
                        child: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // Handle edit image
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              _buildTextField(
                label: 'Họ và tên',
                initialValue: globalController.user.name ?? '',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                label: 'Email',
                initialValue: globalController.user.email ?? '',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                label: 'Mobile number',
                initialValue: globalController.user.phone ?? '',
                icon: Icons.phone_android_outlined,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Handle save
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ).marginOnly(top: 20),
    );
  }

  Widget _buildTextField({
    required String label,
    required String initialValue,
    required IconData icon,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const UnderlineInputBorder(),
      ),
    );
  }
}
