import 'package:get/get.dart';
import 'package:getx_project_1/controller/storeController.dart';

class StoreControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(() => StoreController());
  }
}
