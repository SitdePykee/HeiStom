import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/common/global_controller.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/repository/owner_lodging_repository.dart';

class OwnerEditPersonalInfoPage extends StatefulWidget {
  OwnerEditPersonalInfoPage({super.key});

  @override
  State<OwnerEditPersonalInfoPage> createState() =>
      _OwnerEditPersonalInfoPageState();
}

class _OwnerEditPersonalInfoPageState extends State<OwnerEditPersonalInfoPage> {
  final ownerLodgingRepository = OwnerLodgingRepository();

  final GlobalController globalController = Get.find();
  final _formKey = GlobalKey<FormState>();
  XFile? _avatarFile;

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;

  final isLoading = RxBool(false);

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: globalController.user.name ?? '');
    _emailController =
        TextEditingController(text: globalController.user.email ?? '');
    _phoneController =
        TextEditingController(text: globalController.user.phone ?? '');
    _addressController =
        TextEditingController(text: globalController.user.address ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Stack(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: _avatarFile != null
                              ? FileImage(File(_avatarFile!.path))
                              : FileImage(
                                      File(globalController.user.avatar ?? ''))
                                  as ImageProvider,
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
                              onPressed: () async {
                                final ImagePicker picker = ImagePicker();
                                final XFile? image = await picker.pickImage(
                                    source: ImageSource.gallery);
                                if (image != null) {
                                  setState(() {
                                    _avatarFile = image;
                                  });
                                }
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
                    controller: _nameController,
                    icon: Icons.person_outline,
                    enabled: !isLoading.value,
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    label: 'Email',
                    controller: _emailController,
                    icon: Icons.email_outlined,
                    enabled: !isLoading.value,
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    label: 'Số điện thoại',
                    controller: _phoneController,
                    icon: Icons.phone_android_outlined,
                    enabled: !isLoading.value,
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    label: 'Địa chỉ',
                    controller: _addressController,
                    icon: Icons.location_on_outlined,
                    enabled: !isLoading.value,
                  ),
                  const SizedBox(height: 40),
                  isLoading.value
                      ? Center(child: const CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              final formData = {
                                'name': _nameController.text,
                                'email': _emailController.text,
                                'phone': _phoneController.text,
                                'address': _addressController.text,
                                'avatar': _avatarFile?.path ??
                                    globalController.user.avatar ??
                                    '',
                              };

                              isLoading.value = true;
                              await ownerLodgingRepository.updateUser(formData);
                              isLoading.value = false;
                              // Handle save
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                message: 'Vui lòng nhập đầy đủ thông tin',
                                duration: const Duration(seconds: 2),
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.red,
                                margin: const EdgeInsets.all(10),
                                borderRadius: 10,
                                icon: const Icon(Icons.error,
                                    color: Colors.white),
                              ));
                            }
                          },
                          child: const Text('Cập nhật thông tin'),
                        ),
                ],
              ),
            ),
          ),
        ),
      ).marginOnly(top: 20),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool enabled = true,
  }) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const UnderlineInputBorder(),
      ),
    );
  }
}
