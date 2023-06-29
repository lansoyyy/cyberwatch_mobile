import 'package:cyberwatch_mobile/utils/colors.dart';
import 'package:cyberwatch_mobile/widgets/drawer_widget.dart';
import 'package:cyberwatch_mobile/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        backgroundColor: primary,
        title: TextRegular(
          text: 'HOME',
          fontSize: 18,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
    );
  }
}
