import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project_1/controller/storeController.dart';
import 'package:getx_project_1/bindings/storeContoller.dart';

class MyHomePage extends GetView<StoreController> {
  MyHomePage({super.key});

  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Project 1"),
      ),
      body: Center(
        child: Column(
          children: [
            // Display Store Name
            Obx(() => Text(storeController.storeName.value)),

            // spacing
            const SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // display store status
                Obx(
                  () => Text(
                    storeController.storeStatus.value == true
                        ? 'Store is Open'
                        : 'Store is Closed',
                  ),
                ),

                // spacing
                const SizedBox(
                  width: 20,
                ),

                // button to change store status
                ElevatedButton(
                    onPressed: () {
                      storeController.UpdateStoreStatus();
                    },
                    child: Obx(
                      () => Text(
                          '${storeController.storeStatus.value == true ? 'Close ' : 'Open'}'),
                    )),
              ],
            ),

            // Text Field
            TextField(
              controller: storeController.storeNameEditingController,
              decoration: const InputDecoration(
                hintText: 'Enter Store Name',
              ),
            ),

            // spacing
            const SizedBox(
              height: 20,
            ),

            // button to update store name
            ElevatedButton(
              onPressed: () {
                storeController.updateStoreName(
                  name: storeController.storeNameEditingController.text,
                );

                //Show SnackBar
                Get.snackbar(
                  'Store Name Updated to : ${storeController.storeName.value == '' ? 'no name given' : storeController.storeName.value}',
                  'Store Name Updated Successfully',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              },
              child: const Text('Update'),
            ),

            // spacing
            const SizedBox(
              height: 50,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Display Followers Count
                Obx(
                  () => Text('${storeController.followersCount.value}'),
                ),

                // decrease followers
                ElevatedButton(
                  onPressed: () {
                    storeController.decreaseFollowersCount();
                  },
                  child: const Text('Decrease Followers'),
                ),
                // incease followers
                ElevatedButton(
                  onPressed: () {
                    storeController.increaseFollowersCount();
                  },
                  child: const Text('Increase Followers'),
                ),
              ],
            ),

            // spacing
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
