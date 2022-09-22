import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../main.dart';
import '../../../model/items/get_items_data.dart';
import '../../../model/items/item_model.dart';
import '../../../veiw/components/circlar_method.dart';
import '../../../veiw/components/public_widgets/bttons.dart';
import '../../../veiw/components/public_widgets/custom_text.dart';
import '../../../veiw/helper/consts/colors.dart';

class ItemVeiwModel extends GetxController {
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController priceCont = TextEditingController();
  final TextEditingController vatCont = TextEditingController();
  final TextEditingController imageCont = TextEditingController();
  String? intailData;
  List<String> drobList = ['kg', "piece", "meter", "mg", "liter", "mm"];
  oncganged(String? val) {
    intailData = val.toString();
    update();
  }

  // get item data
  //start
  List<ItemModel> _itemData = [];
  Future<void> fetchItemData() async {
    _itemData.clear();
    _itemData = await ItemData().getItemData();
    update();
  }

  List<ItemModel> get itemData => _itemData;
  //end

  int createId() {
    Random random = Random();
    int min = 10;
    int max = 1000000000;
    int min2 = 1000;
    int max2 = 100000000;

    int result = min + random.nextInt(max - min) + random.nextInt(max2 - min2);
    return result;
  }

  //upload image
  //start
  File? file;

  void uploadImage() async {
    Get.bottomSheet(
        isDismissible: false,
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
            tileMode: TileMode.mirror,
          ),
          child: Container(
            width: Get.width,
            height: Get.width * 0.5,
            decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    Get.width * 0.12,
                  ),
                  topRight: Radius.circular(
                    Get.width * 0.12,
                  ),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppText(
                  color: AppColors.fontColor,
                  fw: FontWeight.bold,
                  txt: ' اختار صورة من 🖼️:',
                  size: Get.width * 0.045,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton6(
                      icon: Icons.photo,
                      txt: 'Gallery',
                      ontap: () async {
                        await uploading(
                          ImageSource.gallery,
                        );
                        Get.back();
                        Get.back();
                      },
                    ),
                    CustomButton6(
                      icon: Icons.photo_camera_rounded,
                      txt: 'Camera',
                      ontap: () async {
                        await uploading(
                          ImageSource.camera,
                        );
                        Get.back();
                        Get.back();
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        enableDrag: true);
  }

  String? url;
  Future<void> uploading(ImageSource img) async {
    final imagePicker = ImagePicker();

    var imagePicked = await imagePicker.pickImage(source: img);
    if (imagePicked != null) {
      showCircular();
      file = File(imagePicked.path);
      imageCont.text = imagePicked.name;
      var refStorage = FirebaseStorage.instance
          .ref('items/${sharedpref!.getString('company')}/${imagePicked.name}');
      await refStorage.putFile(file!);
      refStorage.getDownloadURL().then((value) {
        url = value.toString();
      });
    } else {
      // ignore: avoid_returning_null_for_void
      return null;
    }
  }

//end

// upload item
//start
  CollectionReference ref = FirebaseFirestore.instance.collection('products');
  Future<void> uploadItem() async {
    showCircular();
    await ref.doc().set(ItemModel(
          companyId: sharedpref!.getInt('id')!,
          companyName: sharedpref!.getString('company')!,
          id: createId(),
          name: nameCont.text,
          price: double.parse(priceCont.text),
          unit: intailData!,
          url: url!,
          vat: double.parse(vatCont.text),
          quntity: 1,
        ).toMap());
    await fetchItemData();
    Get.back();
    Get.back();
  }

//end
  @override
  void onInit() async {
    await fetchItemData();
    super.onInit();
  }
}
