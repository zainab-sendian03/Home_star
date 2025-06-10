import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_star_app/core/routes/app_pages.dart';
import 'package:home_star_app/core/themes/assets.dart';
import 'package:home_star_app/features/familyHub/controllers/add_child_controller.dart';
import 'package:home_star_app/features/familyHub/controllers/family_hub_controller.dart';
import 'package:home_star_app/features/familyHub/models/child_model.dart';
import 'package:uuid/uuid.dart';

class AddChildViewBody extends StatefulWidget {
  const AddChildViewBody({super.key});

  @override
  State<AddChildViewBody> createState() => _AddChildViewBodyState();
}

class _AddChildViewBodyState extends State<AddChildViewBody> {
  final _uuid = const Uuid();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final addchildController = Get.put(AddChildController());
  final familyHubController = Get.put(FamilyHubController());
  String? imageUrl;
  bool isLoading = false;
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "إضافة طفل",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff47B4EA),
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed(AppPages.home);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'اسم الطفل',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال اسم الطفل';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'العمر',
                    prefixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال العمر';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedGender,
                    elevation: 2,
                    decoration: InputDecoration(
                      hintText: 'الجنس',
                      prefixIcon: const Icon(Icons.person_outline),
                      border: InputBorder.none,
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'ذكر',
                        child: Text('ذكر'),
                      ),
                      DropdownMenuItem(
                        value: 'أنثى',
                        child: Text('أنثى'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى اختيار الجنس';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          children: [
                            if (addchildController.imageUrl.value.isNotEmpty)
                              Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                      child: Image.file(
                                        File(addchildController.imageUrl.value),
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Center(
                                            child: Icon(
                                              Icons.error_outline,
                                              color: Colors.red,
                                              size: 50,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    left: 8,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.close,
                                            color: Colors.white),
                                        onPressed: () {
                                          addchildController.clearImage();
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            InkWell(
                              onTap: () async {
                                await addchildController.pickImage();
                                setState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  color:
                                      addchildController.imageUrl.value.isEmpty
                                          ? Colors.grey.shade50
                                          : Colors.grey.shade100,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: const Radius.circular(12),
                                    bottomRight: const Radius.circular(12),
                                    topLeft: addchildController
                                            .imageUrl.value.isEmpty
                                        ? const Radius.circular(12)
                                        : Radius.zero,
                                    topRight: addchildController
                                            .imageUrl.value.isEmpty
                                        ? const Radius.circular(12)
                                        : Radius.zero,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      addchildController.imageUrl.value.isEmpty
                                          ? Icons.add_photo_alternate
                                          : Icons.edit,
                                      color: const Color(0xff47B4EA),
                                      size: 32,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      addchildController.imageUrl.value.isEmpty
                                          ? "إضافة صورة"
                                          : "تعديل الصورة",
                                      style: const TextStyle(
                                        color: Color(0xff47B4EA),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "أو",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          children: [
                            if (addchildController.avatarUrl.value.isNotEmpty)
                              Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            addchildController.avatarUrl.value),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    left: 8,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.close,
                                            color: Colors.white),
                                        onPressed: () {
                                          addchildController.clearAvatar();
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const AvatarSelectionDialog(),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  color:
                                      addchildController.avatarUrl.value.isEmpty
                                          ? Colors.grey.shade50
                                          : Colors.grey.shade100,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: const Radius.circular(12),
                                    bottomRight: const Radius.circular(12),
                                    topLeft: addchildController
                                            .avatarUrl.value.isEmpty
                                        ? const Radius.circular(12)
                                        : Radius.zero,
                                    topRight: addchildController
                                            .avatarUrl.value.isEmpty
                                        ? const Radius.circular(12)
                                        : Radius.zero,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      addchildController.avatarUrl.value.isEmpty
                                          ? Icons.child_care
                                          : Icons.edit,
                                      color: const Color(0xff47B4EA),
                                      size: 32,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      addchildController.avatarUrl.value.isEmpty
                                          ? "اختيار أفاتار"
                                          : "تعديل الأفاتار",
                                      style: const TextStyle(
                                        color: Color(0xff47B4EA),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (nameController.text.isNotEmpty &&
                          ageController.text.isNotEmpty) {
                        final child = Child(
                          points: 0,
                          id: _uuid.v4(),
                          name: nameController.text,
                          age: int.parse(ageController.text),
                          imagePath:
                              addchildController.imageUrl.value.isNotEmpty
                                  ? addchildController.imageUrl.value
                                  : addchildController.avatarUrl.value,
                        );

                        familyHubController.addChild(child);
                        Get.back();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff47B4EA),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'إضافة',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AvatarSelectionDialog extends StatelessWidget {
  const AvatarSelectionDialog({super.key});

  final List<String> avatars = const [
    Assets.assetsImagesAvatar,
    Assets.assetsImagesAvatar2,
    Assets.assetsImagesAvatar3,
    Assets.assetsImagesAvatar4,
  ];

  @override
  Widget build(BuildContext context) {
    final addchildController = Get.find<AddChildController>();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'اختر الأفاتار',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: avatars.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      addchildController.setAvatarUrl(avatars[index]);
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          avatars[index],
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('إلغاء'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
