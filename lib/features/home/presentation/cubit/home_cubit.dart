import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediconda/features/notification/presentation/pages/notification_screen.dart';
import 'package:mediconda/features/profile/presentation/pages/profile_screen.dart';
import 'package:mediconda/features/wishlist/presentation/pages/wishlist_screen.dart';

import '../../../search/presentation/pages/search_screen.dart';
import '../components/home_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int navigationIndex = 0;
  static HomeCubit cubitProvider (BuildContext context)=>BlocProvider.of(context);
  final pages = [
    const HomeView(),
    const WishlistScreen(),
    const SearchScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  changeBottomNavigationIndex(int index){
    navigationIndex =index;
    emit(HomeChangeIndex());
  }
}
