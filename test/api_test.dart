import 'package:ecommerce/app/modules/product/providers/product_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

main() {
  setUpAll(() {
    Get.lazyPut<ProductProvider>(
      () => ProductProvider(),
    );
  });

  test('get list product', () async {
    final productProvider = Get.find<ProductProvider>();
    var allproduct = await productProvider.getAllProduct(4);
    expect(allproduct, isList);
  });
}
