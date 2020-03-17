import 'package:flutter/material.dart';
import 'package:flutter_weather/services/storage/storage_service.dart';
import 'package:flutter_weather/ui/favorites_screen.dart';
import 'package:flutter_weather/ui/widgets/current_weather_display.dart';

StorageService storageService = StorageService();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController _pageController;
  List<Widget> _widgetOptions = <Widget>[
    Center(child: CurrentWeatherDisplay()),
    Center(child: FavoritesList()),
    Center(child: Text('Index 2: Alerts'))
  ];

  _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _onItemTapped(int index) {
    setState(() {
      _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    storageService.initializePreferences();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.blue[700],
      body: SafeArea(
        child: PageView(
          children: _widgetOptions,
          onPageChanged: _onPageChanged,
          controller: _pageController,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.cloud), title: Text('Weather')),
          BottomNavigationBarItem(icon: Icon(Icons.star), title: Text('Favorites')),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), title: Text('Alerts'))
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

/*
Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
 */
