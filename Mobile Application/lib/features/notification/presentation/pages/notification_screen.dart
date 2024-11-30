import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconda/features/notification/models/notifications_model.dart';
import 'package:mediconda/features/notification/presentation/cubit/notification_cubit.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/font_style_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../cubit/notification_state.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Notifications", onPressed: () {},),
      body: BlocProvider(
        create: (context) => NotificationCubit(),
        child: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            final cubit = NotificationCubit.get(context);
            return ListView.separated(itemBuilder: (context, index) =>NotificationsItem(notificationItem: cubit.notifications[index]),separatorBuilder: (BuildContext context, int index) {
              return const Divider(thickness: 1,);
            },itemCount: cubit.notifications.length, padding: EdgeInsets.symmetric(horizontal: 16.w),);
          },
        ),
      ),
    );
  }
}
class NotificationsItem extends StatelessWidget {
  const NotificationsItem({super.key, required this.notificationItem});
final NotificationsModel notificationItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(notificationItem.icon),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(notificationItem.title,style: FontStyleManager.getOverPassRegular(fontSize: 14.sp,color: ColorManager.darkerBlue),),
                        Text(notificationItem.createdAt,style: FontStyleManager.getOverPassRegular(fontSize: 13.sp,color: ColorManager.lighterBlue),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if(notificationItem.readAt ==null)
            Container(
             width: 12.w,
             height: 12.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.red,
              ),
                        ),
        ],
      ),
    );
  }
}
