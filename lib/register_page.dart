import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  void _registerUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
    prefs.setString('password', _passwordController.text);
    prefs.setString('email', _emailController.text);
    prefs.setString('firstName', _firstNameController.text);
    prefs.setString('lastName', _lastNameController.text);

    Navigator.pop(context); // Giriş sayfasına dön
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kaydol')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Kullanıcı Adı'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Şifre'),
              obscureText: true,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'E-posta'),
            ),
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'Ad'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Soyad'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _registerUser(context),
              child: Text('Kaydol'),
            ),
          ],
        ),
      ),
    );
  }
}
