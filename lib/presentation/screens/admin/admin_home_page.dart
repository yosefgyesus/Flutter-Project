import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Welcome, Admin!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildSection(
                    title: 'Manage Users',
                    onTap: () {
                      Navigator.pushNamed(context, '/manageUser');
                    },
                  ),
                  _buildSection(
                    title: 'View Content',
                    onTap: () {
                      Navigator.pushNamed(context, '/viewContent');
                    },
                  ),
                  _buildSection(
                    title: 'Create Content',
                    onTap: () {
                      Navigator.pushNamed(context, '/createContent');
                    },
                  ),
                  _buildSection(
                    title: 'Delete Content',
                    onTap: () {
                      Navigator.pushNamed(context, '/deleteContent');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required VoidCallback onTap}) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
      tileColor: Colors.grey[300],
    );
  }
}
