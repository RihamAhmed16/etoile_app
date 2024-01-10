import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(" "),
              ),
              const SizedBox(height: 20),
              const Text(
                "name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 10),
              const Text("Email"),
              const SizedBox(height: 30),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(labelText: "First Name"),
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        decoration: InputDecoration(labelText: "Last Name"),
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        decoration: InputDecoration(labelText: "Email"),
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        decoration: InputDecoration(labelText: "Phone"),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField(
                              items: const [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text("1"),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text("2"),
                                ),
                                //etc
                              ], onChanged: (int? value) {  },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: DropdownButtonFormField(
                              items: const [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text("Jan"),
                                ),
                                //etc months
                              ], onChanged: (int? value) {  },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  //   onPressed: (){},
                  onPressed: () {  },
                  child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
/* <<<with clean code>>>

// widget
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

// state
class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(title: Text("Profile"));
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildProfileSection(),
          buildDetailsCard()
        ],
      ),
    );
  }

  Widget buildProfileSection() {
  Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(" "),
              ),
              SizedBox(height: 20),
              Text(
                "name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),
              Text("Email"),

  }

  Widget buildDetailsCard() {
Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: "First Name"),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(labelText: "Last Name"),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(labelText: "Email"),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(labelText: "Phone"),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField(
                              items: [
                                DropdownMenuItem(
                                  child: Text("1"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("2"),
                                  value: 2,
                                ),
                                //etc
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: DropdownButtonFormField(
                              items: [
                                DropdownMenuItem(
                                  child: Text("Jan"),
                                  value: 1,
                                ),
                                //etc months
                              ],
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonFormField(
                              //years
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
Widget buildProfileImage() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(50),
    child: Image.asset(profileImageAsset)
  );
}

String get profileImageAsset => "assets/images/user.png";

const double profileSectionPadding = 20;

// usage
Padding(
  padding: EdgeInsets.all(profileSectionPadding)
)
  }

}

 */
