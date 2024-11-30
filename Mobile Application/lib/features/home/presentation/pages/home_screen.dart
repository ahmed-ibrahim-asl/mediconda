import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconda/core/managers/color_manager.dart';
import 'package:mediconda/core/managers/size_manager.dart';
import 'package:mediconda/features/home/presentation/cubit/home_cubit.dart';



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
      backgroundColor: cubit.navigationIndex== 4 ? ColorManager.darkBlue : ColorManager.white,
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

