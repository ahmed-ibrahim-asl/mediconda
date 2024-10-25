import 'package:flutter/material.dart';
import 'package:mediconda/core/managers/constant_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../home/component/build_product_grid.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar:  CustomAppBar(title: "Wishlist", onPressed: () {
        setState(() {
          wishlist.clear();
        });
      },),
      body:
       const BuildProductGrid(),
    );
  }
}

