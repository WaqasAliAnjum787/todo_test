import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      NetworkImage('https://example.com/profile.jpg'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  initialValue: 'John Doe',
                  decoration: InputDecoration(labelText: 'User Name'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: 'john.doe@example.com',
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: 'Software Developer',
                  decoration: InputDecoration(labelText: 'User Name'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add navigation to edit profile page
                  },
                  child: Text('Edit Profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
