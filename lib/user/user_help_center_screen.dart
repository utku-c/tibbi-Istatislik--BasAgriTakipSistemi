import 'package:flutter/material.dart';

class UserHelpCenterScreen extends StatefulWidget {
  const UserHelpCenterScreen({Key? key}) : super(key: key);
  static String routeName = "/help_center";

  @override
  State<UserHelpCenterScreen> createState() => _UserHelpCenterScreenState();
}

class _UserHelpCenterScreenState extends State<UserHelpCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yardim Merkezi")),
    );
  }
}
