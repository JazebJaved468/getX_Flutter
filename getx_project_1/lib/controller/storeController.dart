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

  // function ot update Store name
  updateStoreName({required String name}) {
    storeName.value = name;
  } 

  // function to increase followers count
  increaseFollowersCount() {
    followersCount.value = followersCount.value + 1;
  }

  // function to decrease followers count
  decreaseFollowersCount() {
    if (followersCount.value <= 0) {
      Get.snackbar(
        "Followers can't be less than zero",
        "Not Possible",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
      );
    } else {
      followersCount.value = followersCount.value - 1;
    }
  }

  // function to update store status
  updateStoreStatus() {
    storeStatus.value = !(storeStatus.value == true);
  }

  // function to add follower
  addFollower({required String followerName}) {
    String refinedFollowerName = followerName.trim();
    if (refinedFollowerName == "") {
      Get.snackbar(
        "Follower Name can't be empty",
        "Not Possible",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
      );
    } else {
      followerList.add(refinedFollowerName);
    }
  }

  
}
