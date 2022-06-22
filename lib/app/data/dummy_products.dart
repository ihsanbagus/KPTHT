import '../modules/product/product_model.dart';

List<ProductModel> dummyProducts = List.generate(
  16,
  (index) => ProductModel(
    id: index,
    title: "John Hardy Women's",
    price: "50.99",
    description:
        "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
    category: "bag",
    image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    rating: RatingModel(
      rate: "4.5",
      count: 10,
    ),
  ),
);
