import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'login_page.dart';
import 'profile_page.dart';
import '../../services/google_auth_service.dart';
import '../../../injection_container.dart' as di;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final GoogleAuthService _googleAuthService = di.sl<GoogleAuthService>();

  void _refreshAuthState() {
    setState(() {
      // This will rebuild and check authentication state
    });
  }

  List<Widget> _getPages() {
    final isAuthenticated = _googleAuthService.isAuthenticated;
    return [
      const PlaceholderPage(title: 'Home'),
      const PlaceholderPage(title: 'Search'),
      const PlaceholderPage(title: 'Parking'),
      isAuthenticated
          ? ProfilePage(onAuthStateChanged: _refreshAuthState)
          : LoginPage(onAuthStateChanged: _refreshAuthState),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPages()[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title, style: const TextStyle(fontSize: 24))),
    );
  }
}
