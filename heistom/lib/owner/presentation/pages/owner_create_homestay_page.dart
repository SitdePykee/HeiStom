import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/global_controller.dart';
import '../../../common/widgets/app_bar.dart';
import '../controllers/owner_create_homestay_c.dart';

class OwnerCreateHomestayPage extends StatefulWidget {
  const OwnerCreateHomestayPage({super.key});

  @override
  State<OwnerCreateHomestayPage> createState() =>
      _OwnerCreateHomestayPageState();
}

class _OwnerCreateHomestayPageState extends State<OwnerCreateHomestayPage> {
  final controller = Get.put(OwnerCreateHomestayController());

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _roomAreaController = TextEditingController();
  final _dayPriceController = TextEditingController();
  final _hourPriceController = TextEditingController();
  final _descriptionController = TextEditingController();

  // Add new controllers for rooms
  List<Map<String, TextEditingController>> _roomControllers = [
    {
      'roomName': TextEditingController(),
      'capacity': TextEditingController(),
    }
  ];

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
    _roomAreaController.dispose();
    _dayPriceController.dispose();
    _hourPriceController.dispose();
    _descriptionController.dispose();

    // Dispose room controllers
    for (var room in _roomControllers) {
      room['roomName']?.dispose();
      room['capacity']?.dispose();
    }
    super.dispose();
  }

  void _addRoom() {
    setState(() {
      _roomControllers.add({
        'roomName': TextEditingController(),
        'capacity': TextEditingController(),
      });
    });
  }

  void _removeRoom(int index) {
    if (_roomControllers.length > 1) {
      setState(() {
        _roomControllers[index]['roomName']?.dispose();
        _roomControllers[index]['capacity']?.dispose();
        _roomControllers.removeAt(index);
      });
    }
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
                    final globalController = Get.find<GlobalController>();
                    Map<String, dynamic> formData = {
                      'name': _nameController.text,
                      'address': _addressController.text,
                      'area': _roomAreaController.text,
                      'dayPrice': double.parse(_dayPriceController.text),
                      'hourPrice': double.parse(_hourPriceController.text),
                      'description': _descriptionController.text,
                      'ownerId': globalController.user.id ?? '',
                      'amenities': [
                        if (_wifiSelected) 'free_wifi',
                        if (_breakfastSelected) 'free_breakfast',
                        if (_gymSelected) 'gym',
                        if (_childFriendlySelected) 'children_friendly',
                        if (_parkingSelected) 'free_parking',
                        if (_petsAllowedSelected) 'pet_friendly',
                        if (_acSelected) 'air_conditioning',
                        if (_poolSelected) 'swimming_pool',
                        if (_barSelected) 'bar',
                        if (_privateDiningSelected) 'private_dining_room',
                      ],
                      'images': _imageFiles.map((file) => file.path).toList(),
                      'rooms': _roomControllers
                          .map((room) => {
                                'roomName':
                                    int.parse(room['roomName']?.text ?? '0'),
                                'capacity':
                                    int.parse(room['capacity']?.text ?? '0'),
                              })
                          .toList(),
                    };

                    controller.createLodging(formData);
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[300]!)),
                      child: _imageFiles.isNotEmpty
                          ? Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _imageFiles.length,
                                  itemBuilder: (context, index) {
                                    return Image.file(
                                      _imageFiles[index],
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      _imageFiles.length,
                                      (index) => Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white.withOpacity(0.8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                ),
                const SizedBox(height: 20),
                _buildTextField(
                    label: 'Tên homestay', controller: _nameController),
                _buildTextField(
                    label: 'Địa chỉ', controller: _addressController),
                _buildTextField(
                    label: 'Diện tích phòng',
                    keyboardType: TextInputType.number,
                    controller: _roomAreaController),
                _buildTextField(
                    label: 'Giá thuê theo ngày',
                    keyboardType: TextInputType.number,
                    controller: _dayPriceController),
                _buildTextField(
                    label: 'Giá thuê theo giờ',
                    keyboardType: TextInputType.number,
                    controller: _hourPriceController),
                _buildTextField(
                    label: 'Mô tả chi tiết',
                    maxLines: 3,
                    controller: _descriptionController),
                const SizedBox(height: 10),
                _buildAmenitiesSection(),
                const SizedBox(height: 20),
                _buildRoomsSection(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
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

  Widget _buildRoomsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Thông tin phòng',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            TextButton.icon(
              onPressed: _addRoom,
              icon: const Icon(Icons.add),
              label: const Text('Thêm phòng'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue[600],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ...List.generate(_roomControllers.length, (index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Phòng số ${index + 1}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (_roomControllers.length > 1)
                      IconButton(
                        icon:
                            const Icon(Icons.delete_outline, color: Colors.red),
                        onPressed: () => _removeRoom(index),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildTextField(
                  label: 'Tên phòng',
                  controller: _roomControllers[index]['roomName'],
                ),
                _buildTextField(
                  label: 'Số người tối đa',
                  keyboardType: TextInputType.number,
                  controller: _roomControllers[index]['capacity'],
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
