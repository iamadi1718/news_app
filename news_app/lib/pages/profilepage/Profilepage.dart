// profile_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/ThemeController.dart';


class ProfilePage extends StatelessWidget {
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Info
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blueGrey,// Replace with network or asset
            ),
            SizedBox(height: 10),
            Text(
              "Aditya Lohani",
              
            ),
            Text(
              "aditya@example.com",
           
            ),
            SizedBox(height: 30),

            // Mode Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark Mode", style: TextStyle(fontSize: 18)),
                Obx(() => Switch(
                      value: themeController.isDarkMode.value,
                      onChanged: (val) => themeController.toggleTheme(),
                    )),
              ],
            ),

            // You can add more profile options here
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
