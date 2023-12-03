import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project_1/controller/storeController.dart';

class ChangeName extends GetView<StoreController> {
  ChangeName({super.key});

  final StoreController storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    // media queries
    final mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Name Change Page"),
      ),
      body: Center(
        child: Container(
          width: mediaWidth * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text Field
              TextField(
                controller: storeController.storeNameEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Store Name',
                ),
              ),

              // spacing
              const SizedBox(
                height: 20,
              ),

              // button to change store name
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
                      duration: Duration(seconds: 1));
                },
                child: const Text('Update Store Name'),
              ),

              // spacing
              const SizedBox(
                height: 20,
              ),

              //button to go back
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Go Back'),
              ),

              Text(
                  "Note that: by changing the store name from this page, it is updated in the whole application (In the previous pages as well)")
            ],
          ),
        ),
      ),
    );
  }
}
