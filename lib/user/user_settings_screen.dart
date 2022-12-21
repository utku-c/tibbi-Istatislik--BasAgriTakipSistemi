import 'package:flutter/material.dart';

class UserProfileSetting extends StatefulWidget {
  const UserProfileSetting({Key? key}) : super(key: key);
  static String routeName = "/setting";

  @override
  State<UserProfileSetting> createState() => _UserProfileSettingState();
}

class _UserProfileSettingState extends State<UserProfileSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ayarlar")),
    );
  }
}
