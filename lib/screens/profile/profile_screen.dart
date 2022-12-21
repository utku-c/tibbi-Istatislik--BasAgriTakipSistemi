import 'package:flutter/material.dart';
import '../../user/user_help_center_screen.dart';
import '../../user/user_notification_screen.dart';
import '../../user/user_screen.dart';
import '../../user/user_settings_screen.dart';
import 'widgets/profile_menu_item.dart';
import 'widgets/profile_pic.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);
  static String routeName = "/profile";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 0;
  Future<void> goPage(int index) async {
    switch (index) {
      case 0:
        await Navigator.pushNamed(context, UserProfile.routeName);
        break;
      case 1:
        await Navigator.pushNamed(context, UserNotification.routeName);
        break;
      case 2:
        await Navigator.pushNamed(context, UserProfileSetting.routeName);
        break;
      case 3:
        await Navigator.pushNamed(context, UserHelpCenterScreen.routeName);
        break;
      case 4:
        // await Navigator.pushNamed(context, UserProfileSetting.routeName);
        break;
      default:
    }
  }

  List<ProfileMenuItem> profilMenuItems = [
    const ProfileMenuItem(
      text: "My Account",
      icon: "assets/icons/home_userprofile.svg",
    ),
    const ProfileMenuItem(
      text: "Bildirimler",
      icon: "assets/icons/profile_notification.svg",
    ),
    const ProfileMenuItem(
      text: "Ayarlar",
      icon: "assets/icons/profile_settings.svg",
    ),
    const ProfileMenuItem(
      text: "Yardim Merkezi",
      icon: "assets/icons/profile_information.svg",
    ),
    const ProfileMenuItem(
      text: "Cikis",
      icon: "assets/icons/profile_logout.svg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Profilim"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const ProfilePic(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Utku"),
                    Text("Bilgin"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 400,
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  profilMenuItems.length,
                  ((index) => GestureDetector(
                        onTap: () {
                          goPage(index);
                        },
                        child: ProfileMenuItem(
                          text: profilMenuItems[index].text,
                          icon: profilMenuItems[index].icon,
                        ),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
