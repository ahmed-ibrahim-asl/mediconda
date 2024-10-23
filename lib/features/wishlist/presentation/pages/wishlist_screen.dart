import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../home/component/build_product_grid.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar:  CustomAppBar(title: "Wishlist", onPressed: () {  },),
      body:
      const BuildProductGrid(),
    );
  }
}

