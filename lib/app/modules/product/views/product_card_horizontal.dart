import 'package:ecommerce/app/modules/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCardHorizontal extends StatelessWidget {
  final ProductModel product;
  const ProductCardHorizontal({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width < 600 ? 140 : 204,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Image.network(
                "${product.image}",
                fit: BoxFit.contain,
                height: 140,
                width: 130,
              ),
              Text(
                "\$50.99",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(width: 5),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "${product.title}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      "${product.description}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.star, size: 12),
                    Text(
                      "${product.rating?.rate}",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
