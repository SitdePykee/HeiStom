import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/widgets/app_bar.dart';

class OwnerCreateHomestayPage extends StatefulWidget {
  const OwnerCreateHomestayPage({super.key});

  @override
  State<OwnerCreateHomestayPage> createState() =>
      _OwnerCreateHomestayPageState();
}

class _OwnerCreateHomestayPageState extends State<OwnerCreateHomestayPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _roomCountController = TextEditingController();
  final _roomAreaController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();

  bool _wifiSelected = true;
  bool _breakfastSelected = false;
  bool _gymSelected = false;
  bool _childFriendlySelected = false;
  bool _parkingSelected = false;
  bool _petsAllowedSelected = false;
  bool _acSelected = false;
  bool _poolSelected = false;
  bool _barSelected = false;
  bool _privateDiningSelected = false;

  List<File> _imageFiles = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final List<XFile> pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      setState(() {
        _imageFiles = pickedFiles.map((file) => File(file.path)).toList();
      });
    }
  }

  @override
  void dispose() {
    // Dispose controllers
    _nameController.dispose();
    _addressController.dispose();
    _roomCountController.dispose();
    _roomAreaController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      persistentFooterButtons: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text('Huỷ',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Gather data
                    Map<String, dynamic> formData = {
                      'homestayName': _nameController.text,
                      'address': _addressController.text,
                      'roomCount': _roomCountController.text,
                      'roomArea': _roomAreaController.text,
                      'price': _priceController.text,
                      'description': _descriptionController.text,
                      'amenities': {
                        'wifi': _wifiSelected,
                        'breakfast': _breakfastSelected,
                        'gym': _gymSelected,
                        'childFriendly': _childFriendlySelected,
                        'parking': _parkingSelected,
                        'petsAllowed': _petsAllowedSelected,
                        'ac': _acSelected,
                        'pool': _poolSelected,
                        'bar': _barSelected,
                        'privateDining': _privateDiningSelected,
                      },
                      'imagePaths':
                          _imageFiles.map((file) => file.path).toList(),
                    };

                    // Convert to JSON and print
                    String jsonData = jsonEncode(formData);
                    // ignore: avoid_print
                    print('Form Data JSON: $jsonData');

                    // Handle submit (e.g., send data to backend)
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text('Thêm thông tin phòng',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppBarWidget(),
                const SizedBox(height: 20),
                const Text(
                  'Thêm Homestay:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[300]!)),
                    child: _imageFiles.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _imageFiles.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.file(_imageFiles[index],
                                    fit: BoxFit.cover, width: 150),
                              );
                            },
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.cloud_upload_outlined,
                                    size: 50, color: Colors.grey[600]),
                                const SizedBox(height: 8),
                                Text(
                                  'Tải hình ảnh lên',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue[700],
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                    label: 'Tên homestay', controller: _nameController),
                _buildTextField(
                    label: 'Địa chỉ', controller: _addressController),
                _buildTextField(
                    label: 'Số lượng phòng',
                    keyboardType: TextInputType.number,
                    controller: _roomCountController),
                _buildTextField(
                    label: 'Diện tích phòng',
                    keyboardType: TextInputType.number,
                    controller: _roomAreaController),
                _buildTextField(
                    label: 'Giá thuê gốc',
                    keyboardType: TextInputType.number,
                    controller: _priceController),
                _buildTextField(
                    label: 'Mô tả chi tiết',
                    maxLines: 3,
                    controller: _descriptionController),
                const SizedBox(height: 10),
                _buildAmenitiesSection(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
      // The bottom navigation bar is usually part of a higher-level Scaffold (e.g., in main.dart or a home page).
      // If this page is meant to be a standalone screen with its own nav bar, it can be added here.
      // For now, I'm focusing on the form content. Example:
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.add_box_rounded), label: 'Add'),
      //     BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
      //     BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //   ],
      //   currentIndex: 1, // Assuming 'Add' is the active tab
      //   selectedItemColor: Colors.blue,
      //   unselectedItemColor: Colors.grey,
      //   showUnselectedLabels: false,
      //   type: BottomNavigationBarType.fixed,
      // ),
    );
  }

  Widget _buildTextField(
      {required String label,
      int maxLines = 1,
      TextInputType? keyboardType,
      TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          fillColor: Colors.grey[100],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Vui lòng nhập $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildAmenitiesSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        iconColor: Colors.grey[700],
        collapsedIconColor: Colors.grey[700],
        title: Text(
          'Thêm tiện ích',
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
              fontWeight: FontWeight.normal),
        ),
        initiallyExpanded: true, // Or manage with a state variable
        childrenPadding:
            const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0),
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        children: <Widget>[
          _buildCheckboxListTile('Wifi miễn phí', _wifiSelected, (bool? value) {
            setState(() {
              _wifiSelected = value!;
            });
          }),
          _buildCheckboxListTile('Bữa sáng miễn phí', _breakfastSelected,
              (bool? value) {
            setState(() {
              _breakfastSelected = value!;
            });
          }),
          _buildCheckboxListTile('Phòng gym', _gymSelected, (bool? value) {
            setState(() {
              _gymSelected = value!;
            });
          }),
          _buildCheckboxListTile('Phù hợp trẻ nhỏ', _childFriendlySelected,
              (bool? value) {
            setState(() {
              _childFriendlySelected = value!;
            });
          }),
          _buildCheckboxListTile('Bãi đỗ xe miễn phí', _parkingSelected,
              (bool? value) {
            setState(() {
              _parkingSelected = value!;
            });
          }),
          _buildCheckboxListTile('Không cấm chó/ mèo', _petsAllowedSelected,
              (bool? value) {
            setState(() {
              _petsAllowedSelected = value!;
            });
          }),
          _buildCheckboxListTile('Điều hoà', _acSelected, (bool? value) {
            setState(() {
              _acSelected = value!;
            });
          }),
          _buildCheckboxListTile('Bể bơi', _poolSelected, (bool? value) {
            setState(() {
              _poolSelected = value!;
            });
          }),
          _buildCheckboxListTile('Quầy bar', _barSelected, (bool? value) {
            setState(() {
              _barSelected = value!;
            });
          }),
          _buildCheckboxListTile('Nhà ăn riêng', _privateDiningSelected,
              (bool? value) {
            setState(() {
              _privateDiningSelected = value!;
            });
          }),
        ],
      ),
    );
  }

  Widget _buildCheckboxListTile(
      String title, bool value, ValueChanged<bool?> onChanged) {
    return CheckboxListTile(
      title: Text(title,
          style: const TextStyle(fontSize: 15, color: Colors.black87)),
      value: value,
      onChanged: onChanged,
      dense: true,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.blue[600],
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
    );
  }
}
