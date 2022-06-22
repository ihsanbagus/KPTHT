import 'package:get/get.dart';

import '../product_model.dart';

class ProductProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) {
        return ProductModel.fromJson(map);
      }
      if (map is List) {
        return map.map((item) => ProductModel.fromJson(item)).toList();
      }
    };
    httpClient.timeout = Duration(seconds: 10);
    httpClient.baseUrl = "https://fakestoreapi.com";
  }

  Future<List<ProductModel>?> getAllProduct(int limit) async {
    final response = await get('/products?limit=$limit');
    return response.body;
  }
}
