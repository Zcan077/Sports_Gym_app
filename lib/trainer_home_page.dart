import 'package:flutter/material.dart';
import 'package:sports_gym_app/widgets/exit_button.dart';

class TrainerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eğitmen Ana Sayfası'),
        actions: [
          ExitButton(), // Çıkış butonunu ekleyin
        ],
      ),
      body: Center(
        child: Text('Eğitmen Hoşgeldiniz!'),
      ),
    );
  }
}
