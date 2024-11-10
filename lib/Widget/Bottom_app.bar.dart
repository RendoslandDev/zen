import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomAppBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const BottomAppBar({super.key, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
            gap: 8,
            backgroundColor: Colors.transparent,
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            onTabChange: (value) => onTabChange!(value),
            tabs: const [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.home, text: 'search'),
              GButton(icon: Icons.home, text: 'favorite'),
            ]),
      ),
    );
  }
}
