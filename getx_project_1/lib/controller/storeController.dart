import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
  final storeName = 'My Store'.obs;
  final followersCount = 0.obs;
  final followerList = [].obs; //remaining
  final storeStatus = true.obs;
  final reviews = [].obs; //remaining

  final storeNameEditingController = TextEditingController();
  final followersCountEditingController = TextEditingController();
  final followerListEditingController = TextEditingController();
  final reviewsEditingController = TextEditingController();

  updateStoreName({required String name}) {
    storeName.value = name;
  }

  increaseFollowersCount() {
    followersCount.value = followersCount.value + 1;
  }

  decreaseFollowersCount() {
    if (followersCount.value <= 0) {
      Get.snackbar(
        "Followers can't be less than zero",
        "Not Possible",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
      );
    } else
      followersCount.value = followersCount.value - 1;
  }

  storeStatusOpen() {
    storeStatus.value = true;
  }

  UpdateStoreStatus() {
    storeStatus.value = !(storeStatus.value == true);
  }
}
