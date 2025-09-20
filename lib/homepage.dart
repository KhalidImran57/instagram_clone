import 'package:flutter/material.dart';
import 'package:instagram_clone_ui/screens/activity_screen.dart';
import 'package:instagram_clone_ui/screens/feed_screen.dart';
import 'package:instagram_clone_ui/screens/profile.dart';
import 'package:instagram_clone_ui/screens/reels_screen.dart';
import 'package:instagram_clone_ui/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const FeedScreen(),
    const SearchScreen(),
    const ReelsScreen(),
    const ActivityScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: "Reels"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Activity"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
