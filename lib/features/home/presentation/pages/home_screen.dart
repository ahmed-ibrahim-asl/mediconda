import 'package:flutter/material.dart';
import 'package:mediconda/core/managers/font_style_manager.dart';
import 'package:mediconda/features/home/component/buildSearchBar.dart';

import '../../component/buildProductGrid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4157FF),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Buildsearchbar(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("All Products",
            style: TextStyle(
              fontSize: FontSizeManager.s18 ,
              fontWeight: FontWeight.bold,
            ),),
          ),
          Expanded(child: Buildproductgrid() ),
        ],
      ),
    );
  }
}
