import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconda/core/managers/color_manager.dart';
import 'package:mediconda/core/managers/size_manager.dart';
import 'package:mediconda/features/home/component/buildSearchBar.dart';
import 'package:mediconda/features/home/presentation/cubit/home_cubit.dart';

import '../../component/build_product_grid.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HomeCubit(),
  child: BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    final  cubit = HomeCubit.cubitProvider(context);
    return Scaffold(
      body: cubit.pages[cubit.navigationIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(SizeManager.mediumBorderRadius)),
        child: BottomNavigationBar(
            backgroundColor: ColorManager.darkerBlue,
            selectedItemColor: ColorManager.blue,
            unselectedItemColor: ColorManager.grey,
currentIndex: cubit.navigationIndex,
            onTap: (index){
cubit.changeBottomNavigationIndex(index)
    ;
            },
            items: [
              // 31 , 48.74
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home_outlined),
                  label: '',
                backgroundColor: ColorManager.darkerBlue,
              ),
              BottomNavigationBarItem(icon: const Icon(Icons.favorite_border), label: '',
                backgroundColor: ColorManager.darkerBlue,
              ),
              BottomNavigationBarItem(icon: const Icon(Icons.search), label: '',
                backgroundColor: ColorManager.darkerBlue,
              ),
              BottomNavigationBarItem(icon: Stack(
                alignment: Alignment.topRight,
                children: [
                  const Icon(Icons.notifications_outlined),

                  Container(
          width: 12.w,
                    height: 12.w,
                    decoration: BoxDecoration(
                      color: ColorManager.red,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorManager.white
                      )
                    ),
                  ),
                ],
              ), label: '',
                backgroundColor: ColorManager.darkerBlue,
              ),
              BottomNavigationBarItem(icon: const Icon(Icons.menu), label: '',
                backgroundColor: ColorManager.darkerBlue,
              ),
            ]),
      ),
    );
  },
),
);
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 1.sw,
          height: 150.h,

          decoration: BoxDecoration(
              color: ColorManager.darkBlue,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(SizeManager.smallBorderRadius))
          ),),
        SizedBox(
          height: 1.sh,
          child: Column(
            children: [
              Container(

                margin:EdgeInsets.only(top: 120.h) ,
                // padding: const EdgeInsets.all( 10.0),

                child: BuildSearchBar(),
              ),
/*
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "All Products",
                    style: TextStyle(
                      fontSize: FontSizeManager.s18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
*/
              const Expanded(child: BuildProductGrid()),
            ],
          ),
        ),
      ],
    );
  }
}
