import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDljYm9lltqV23S8juHgvQ2WvGMWKsh_qgtA&usqp=CAU',
                  ),
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('NIM: 123200172'),
                    SizedBox(height: 8.0),
                    Text('Name: Audrey Rosa'),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Detail'),
            onTap: () {
              Navigator.pushNamed(context, '/profile/detail');
            },
            tileColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('NIM: 123200172'),
            SizedBox(height: 8.0),
            Text('Name: Audrey Rosa'),
            SizedBox(height: 8.0),
            Text('Class: H'),
            SizedBox(height: 8.0),
            Text('Place and Date of Birth: Yogyakarta 25 Oktober 2002'),
            SizedBox(height: 8.0),
            Text('Hopes and Dreams: Be able to keep happy and keep learning'),
          ],
        ),
      ),
    );
  }
}
