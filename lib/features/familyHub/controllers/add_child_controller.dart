import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddChildController extends GetxController {
  final imageUrl = ''.obs;
  final avatarUrl = ''.obs;
  final isAvatar = false.obs;
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void setImageUrl(String url, {bool isAvatarImage = false}) {
    imageUrl.value = url;
    isAvatar.value = isAvatarImage;
  }

  void setAvatarUrl(String url) {
    avatarUrl.value = url;
    imageUrl.value = '';
  }

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );
      if (image != null) {
        final File imageFile = File(image.path);
        if (await imageFile.exists()) {
          imageUrl.value = image.path;
          avatarUrl.value = '';
        } else {
          Get.snackbar(
            'خطأ',
            'لم يتم العثور على الصورة',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء اختيار الصورة',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void clearAvatar() {
    avatarUrl.value = '';
  }

  void clearImage() {
    imageUrl.value = '';
    isAvatar.value = false;
  }

  @override
  void onClose() {
    nameController.dispose();
    ageController.dispose();
    super.onClose();
  }
}
