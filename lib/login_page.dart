import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'trainer_home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final prefs = await SharedPreferences.getInstance();
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Admin kullanıcı adı ve şifre kontrolü
    if (username == 'admin' && password == 'admin123') {
      Navigator.pushReplacementNamed(context, '/admin_home');
    } else {
      final userDetails = prefs.getStringList('user_$username');
      if (userDetails != null && userDetails[2] == password) {
        final role = userDetails[3];
        if (role == 'trainer') {
          Navigator.pushReplacementNamed(context, '/trainer_home');
        } else {
          Navigator.pushReplacementNamed(context, '/user_home');
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Geçersiz kullanıcı adı veya şifre')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Sayfası'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Giriş Yap'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Kaydol'),
            ),
          ],
        ),
      ),
    );
  }
}
