import 'package:flutter/material.dart';
import 'package:sports_gym_app/widgets/exit_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Sayfa'),
        actions: [
          ExitButton(), // Çıkış butonunu ekleyin
        ],
      ),
      body: Center(
        child: Text('Hoşgeldiniz!'),
      ),
    );
  }
}
