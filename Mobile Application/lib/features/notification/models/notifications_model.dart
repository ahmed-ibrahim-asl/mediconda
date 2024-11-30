import 'package:flutter/cupertino.dart';

class NotificationsModel {
  final int id;
  final String title;
  final String? readAt;
  final String createdAt;
  final IconData icon;

  NotificationsModel({required this.id,required this.title,required this.icon, required this.createdAt,  this.readAt, });

}