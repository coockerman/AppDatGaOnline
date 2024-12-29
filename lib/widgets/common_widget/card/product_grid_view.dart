import 'package:flutter/material.dart';
import 'package:flutter_hungry_hub/view_model/home_view_model.dart';
import 'package:get/get.dart';

import '../../common/image_extention.dart';
import '../evaluate/evaluate.dart';
import '../food_detail/food_detail.dart';
import '../text/truncated_text.dart';

class ProductGridView extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductGridView({super.key, required this.product});

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeViewModel());
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetail(productDetail: widget.product,),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      widget.product['ImageUrl'] ?? '',
                      width: double.infinity,
                      height: 95,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        controller.toggleFavorite(widget.product);
                      },
                      child: Obx(
                            () => Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Màu nền xám nhạt
                            shape: BoxShape.circle,  // Hình tròn
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2), // Đổ bóng nhẹ
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(6), // Khoảng cách bên trong
                          child: Icon(
                            controller.isFavorite(widget.product)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: controller.isFavorite(widget.product)
                                ? Colors.red
                                : Colors.grey,
                            size: 24, // Kích thước icon
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TruncatedText(
                      text: widget.product['Name'],
                      maxWidth: 180,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff32343E),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      'Giá: ${widget.product['Price']} VND',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff32343E),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Evaluate(height: 24, width: 71, productDetail: widget.product ?? {},),
                      const Text(
                        ' • FreeShip',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffEF5350),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      controller.addToShoppingCart(widget.product);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
