// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project_1/controller/storeController.dart';
import 'package:getx_project_1/view/changeName.dart';
// import 'package:getx_project_1/bindings/storeContoller.dart';

class MyHomePage extends GetView<StoreController> {
  MyHomePage({super.key});

  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    // media queries
    final mediaWidth = MediaQuery.of(context).size.width;
    // final mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Project 1"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: mediaWidth * 0.8,
            color: Colors.grey[300],
            child: Column(
              children: [
                // Display Store Name
                Obx(() => Text(storeController.storeName.value)),

                ElevatedButton(
                    onPressed: () {
                      Get.to(ChangeName());
                    },
                    child: Text("Change Store Name")),
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
                          storeController.updateStoreStatus();
                        },
                        child: Obx(
                          () => Text(
                              '${storeController.storeStatus.value == true ? 'Close ' : 'Open'}'),
                        )),
                  ],
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
                  height: 40,
                ),

                // Text Field for followers
                TextField(
                  controller: storeController.followerListEditingController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Followers Name',
                  ),
                ),

                // spacing
                const SizedBox(
                  height: 20,
                ),

                // button to add followers
                ElevatedButton(
                  onPressed: () {
                    storeController.addFollower(
                        followerName:
                            storeController.followerListEditingController.text);
                  },
                  child: const Text('Add Followers'),
                ),

                // display followers
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: storeController.followerList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          storeController.followerList[index],
                        ),
                      );
                    },
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
