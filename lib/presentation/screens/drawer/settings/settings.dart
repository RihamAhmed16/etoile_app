import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/presentation/screens/drawer/settings/widgets/settings_item.dart';
import 'package:etoile_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const ListTile(
              title: Text(
                'Account',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SettingItem(
              text: 'Subscribe To Our Newsletter',
              icon: Icons.mail,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.changePasswordScreen);
              },
              child: const SettingItem(
                icon: Icons.security,
                text: 'Change Password',
              ),
            ),
            GestureDetector(
              onTap: () {
                buildShowDialog(context);
              },
              child: const SettingItem(
                icon: Icons.person_remove_alt_1_rounded,
                text: 'Delete account',
              ),
            ),
            const ListTile(
              title: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            buildNotificationCard(),
            const ListTile(
              title: Text(
                'Others',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SettingItem(icon: Icons.star, text: 'Rate the App'),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          title: const Text('Delete Account'),
          content: const Text(
              'Are you sure you want to delete your account? This action cannot be undone.'),
          actions: <Widget>[
            CustomButton(
              text: 'No',
              width: 60.w,
              buttonColor: AppColors.buttonColor,
              onPressed: () {
                Navigator.pop(dialogContext);
              },
            ),
            CustomButton(
              text: 'yes',
              width: 60.w,
              buttonColor: AppColors.lightBlack,
              onPressed: () {
                Navigator.pop(dialogContext);
                Navigator.pushNamed(context, Routes.deleteAccountScreen);
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildNotificationCard() {
    bool isNotificationOn = true;

    return Card(
      child: ListTile(
        leading: const Icon(Icons.notifications),
        title: const Text('Notifications'),
        trailing: Switch(
          value: isNotificationOn,
          onChanged: (value) {
            // Perform action when switch is toggled
          },
        ),
      ),
    );
  }
}
