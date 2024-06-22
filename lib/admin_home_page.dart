import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_gym_app/widgets/exit_button.dart'; // Çıkış butonunu import edin
import 'login_page.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  List<Map<String, String>> users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final userKeys = prefs.getKeys().where((key) => key.startsWith('user_')).toList();
    List<Map<String, String>> loadedUsers = [];

    for (var key in userKeys) {
      final userData = prefs.getStringList(key);
      if (userData != null) {
        final userDetails = {
          'fullname': userData[0],
          'username': userData[1],
          'password': userData[2],
          'role': userData[3],
        };
        loadedUsers.add(userDetails);
      }
    }

    setState(() {
      users = loadedUsers;
    });
  }

  Future<void> _deleteUser(String? username) async {
    if (username != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user_$username');
      _loadUsers();
    }
  }

  Future<void> _makeTrainer(String? username) async {
    if (username != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('role_$username', 'trainer');
      _loadUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Ana Sayfası'),
        actions: [
          ExitButton(), // Çıkış butonunu ekleyin
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text('${user['username']} - ${user['fullname']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteUser(user['username']),
                ),
                IconButton(
                  icon: Icon(Icons.person_add),
                  onPressed: () => _makeTrainer(user['username']),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
