import 'package:flutter/material.dart';

import '../../../home/component/buildSearchBar.dart';
import '../../../home/component/build_product_grid.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: BuildSearchBar(),),
      body:
       const BuildProductGrid(),


    );
  }
}
