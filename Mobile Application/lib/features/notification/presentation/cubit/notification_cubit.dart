import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/notifications_model.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  static NotificationCubit get(context) => BlocProvider.of(context);
  List<NotificationsModel> notifications = [
    NotificationsModel(
      id: 0,
      title:
          'We know that for children AND\nadults-learning is most effective when it is',
      icon: Icons.verified,
      createdAt: 'Aug 12, 2020 at 12:08 PM',
      readAt: null,
    ),
  ];
}
