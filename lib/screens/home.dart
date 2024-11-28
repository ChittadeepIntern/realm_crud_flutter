import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm_poc/providers/bottom_navgation_bar_provider.dart';
import 'package:realm_poc/screens/add_user_screen.dart';
import 'package:realm_poc/screens/edit_user.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Widget> _pages = [const AddUser(), const EditUser()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomNavigationBarProvider>(
        builder: (context, provider, child) => _pages[provider.currentIndex],
      ),
      bottomNavigationBar: Consumer<BottomNavigationBarProvider>(
        builder: (context, provider, child) => BottomNavigationBar(
          currentIndex: provider.currentIndex,
          onTap: (index) => provider.updateCurrentIndex(index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.create), label: "Add User"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Edit User")
          ],
        ),
      ),
    );
  }
}
