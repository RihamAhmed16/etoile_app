import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {

  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/contact_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Card(
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('16312'),
                ),
              ),
              const SizedBox(height: 10),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: Text('feedback@etoileeg.online'),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: Colors.grey[800],
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Our working hours from 10 AM to 1 AM, 7 days per week',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook),
                  SizedBox(width: 10),
                  Icon(Icons.youtube_searched_for),
                  SizedBox(width: 10),
                  Icon(Icons.g_translate),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/* >>> with clean code <<<

Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/contact_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildContactCard(Icons.phone, '16312'),
              SizedBox(height: 10),
              buildContactCard(Icons.email, 'feedback@etoileeg.online'),
              SizedBox(height: 10),
              buildDarkCard('Our working hours from 10 AM to 1 AM, 7 days per week'),
              SizedBox(height: 10),
              buildSocialIconsRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContactCard(IconData icon, String text) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(text),
      ),
    );
  }

  Widget buildDarkCard(String text) {
    return Card(
      color: Colors.grey[800],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget buildSocialIconsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.facebook),
        SizedBox(width: 10),
        Icon(Icons.youtube),
        SizedBox(width: 10),
        Icon(Icons.instagram),
      ],
    );
 */