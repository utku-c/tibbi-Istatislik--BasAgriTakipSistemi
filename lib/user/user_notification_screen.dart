import 'package:flutter/material.dart';

class UserNotification extends StatefulWidget {
  const UserNotification({Key? key}) : super(key: key);
  static String routeName = "/UserNotification";

  @override
  State<UserNotification> createState() => _UserNotificationState();
}

class _UserNotificationState extends State<UserNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bildirimler")),
    );
  }
}
