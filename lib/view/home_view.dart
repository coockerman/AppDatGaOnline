// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_hungry_hub/view_model/home_view_model.dart';
import 'package:flutter_hungry_hub/view_model/test_view_model.dart';
import 'package:flutter_hungry_hub/widgets/common/image_extention.dart';
import 'package:flutter_hungry_hub/widgets/common_widget/food_view/burger_view.dart';
import 'package:flutter_hungry_hub/widgets/common_widget/food_view/chicken_view.dart';
import 'package:flutter_hungry_hub/widgets/common_widget/food_view/combo_view.dart';
import 'package:flutter_hungry_hub/widgets/common_widget/food_view/snacks_view.dart';
import 'package:flutter_hungry_hub/widgets/common_widget/text/title_see_more.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../widgets/common_widget/card/product_list_view_hori.dart';
import '../widgets/common_widget/inwell/home_in_well.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.put(HomeViewModel());
  final controllerTestView = Get.put(TestViewModel());

  List<Map<String, dynamic>> _products = [];
  List<Map<String, dynamic>> _stores = [];
  String? _selectedProductId;
  String? _selectedStoreId;
  bool _isLoadingProducts = true;
  bool _isLoadingStores = false;
  bool _isPlacingOrder = false;

  @override
  void initState() {
    super.initState();
    _loadProducts();
    // _loadStores();
  }

  Future<void> _loadProducts() async {
    await controllerTestView.fetchProducts();
    setState(() {
      _products = controllerTestView.products;
      _isLoadingProducts = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(ImageAsset.locationRed),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'DELIVER TO',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffF44336),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        controller.userData['address'].toString().toUpperCase(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
                child: ClipOval(
                  child: Image.asset(
                    ImageAsset.users,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Text('home'),
      ),
    );
  }
}
