// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import 'package:ecommerce/app/modules/product/bindings/product_binding.dart';
import 'package:ecommerce/app/modules/product/views/product_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PRODUCT;

  static final routes = [
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
  ];
}
