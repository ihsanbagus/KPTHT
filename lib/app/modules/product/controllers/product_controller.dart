import 'package:ecommerce/app/modules/product/product_model.dart';
import 'package:get/get.dart';

import '../providers/product_provider.dart';

class ProductController extends GetxController
    with StateMixin<List<ProductModel>> {
  final productProvider = Get.find<ProductProvider>();
  final isLoading = false.obs;
  final _limit = GetPlatform.isWeb ? 16 : 4;
  final List<ProductModel> _products = [];

  void getAllProduct() {
    printInfo(info: "Get Data Products");
    isLoading.value = true;
    productProvider.getAllProduct(_limit).then((value) {
      isLoading.value = false;
      if (value != null) {
        _products.addAll(value);
        change(_products, status: RxStatus.success());
      } else {
        change(_products, status: RxStatus.error());
      }
    }).catchError((e) {
      isLoading.value = false;
      print("catchError : $e");
    });
  }
}
