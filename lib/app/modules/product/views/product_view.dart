import 'package:ecommerce/app/modules/product/views/product_card_horizontal.dart';
import 'package:ecommerce/app/modules/product/views/product_card_vertical.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    controller.getAllProduct();
    return Scaffold(
      appBar: AppBar(
        title: Text('List Product'),
        centerTitle: true,
      ),
      body: Scrollbar(
        thickness: 10,
        radius: Radius.circular(5),
        child: Center(
          child: controller.obx(
            (products) => Obx(
              () => Container(
                width: GetPlatform.isMobile
                    ? Get.width < 600
                        ? 320
                        : 467
                    : Get.width,
                child: GetPlatform.isMobile
                    ? ListView(
                        children: [
                          ...?products
                              ?.map((e) => ProductCardHorizontal(product: e))
                              .toList(),
                          controller.isLoading.value
                              ? Center(
                                  child: RefreshProgressIndicator(),
                                  heightFactor: 3,
                                )
                              : SizedBox(height: 200),
                        ],
                        physics: BouncingScrollPhysics(),
                        controller: scrollController
                          ..addListener(() {
                            if (scrollController.position.extentAfter < 1 &&
                                !controller.isLoading.value) {
                              print("loading...");
                              controller.getAllProduct();
                            }
                          }),
                        shrinkWrap: true,
                      )
                    : GridView.count(
                        crossAxisCount: 8,
                        scrollDirection: Axis.vertical,
                        childAspectRatio: 1440 / 1024 / 1.5,
                        children: [
                          ...?products?.map(
                            (product) => ProductCardVertical(product: product),
                          )
                        ],
                      ),
              ),
            ),
            onEmpty: Text("Product Empty"),
            onLoading: RefreshProgressIndicator(),
            onError: (e) => Obx(
              () => controller.isLoading.value
                  ? Center(child: RefreshProgressIndicator())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Failed to get data 🧐"),
                        ElevatedButton(
                          onPressed: () {
                            controller.getAllProduct();
                          },
                          child: Text("Refresh"),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
