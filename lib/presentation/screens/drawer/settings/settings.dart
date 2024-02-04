import 'package:flutter/material.dart';

class Settings extends StatelessWidget {

  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            buildSettingCard(Icons.mail, 'Subscribe To Our Newsletter'),
            buildSettingCard(Icons.arrow_forward, 'Change Password'),
            buildSettingCard(Icons.arrow_forward, 'Delete account'),
            buildSettingCard(Icons.arrow_forward, 'Deactivate account'),
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
            buildSettingCard(Icons.star, 'Rate the App'),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget buildSettingCard(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      trailing: const Icon(Icons.arrow_forward),
    );
  }

  Widget buildNotificationCard() {
    bool isNotificationOn = true;

    return ListTile(
      leading: const Icon(Icons.notifications),
      title: const Text('Notifications'),
      trailing: Switch(
        value: isNotificationOn,
        onChanged: (value) {
          // Perform action when switch is toggled
        },
      ),
    );
  }
}
/* with clean code>>
ar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSectionTitle('Account'),
            _buildSettingCard(Icons.mail, 'Subscribe To Our Newsletter'),
            _buildSettingCard(Icons.arrow_forward, 'Change Password'),
            _buildSettingCard(Icons.arrow_forward, 'Delete account'),
            _buildSettingCard(Icons.arrow_forward, 'Deactivate account'),
            _buildSectionTitle('Notifications'),
            _buildNotificationCard(),
            _buildSectionTitle('Others'),
            _buildSettingCard(Icons.star, 'Rate the App'),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSettingCard(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      trailing: Icon(Icons.arrow_forward),
    );
  }

  Widget _buildNotificationCard() {
    bool isNotificationOn = true;

    return ListTile(
      leading: Icon(Icons.notifications),
      title: Text('Notifications'),
      trailing: Switch(
        value: isNotificationOn,
        onChanged: (value) {
          // Perform action when switch is toggled
        },
      ),
    );
 */