import 'package:favourite_application/helper/icon_data.dart';
import 'package:favourite_application/screens/create_group/create_group.dart';
import 'package:favourite_application/screens/home_screen/home_screen.dart';
import 'package:favourite_application/screens/profile_screen/user_profile_page.dart';
import 'package:favourite_application/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../fans_statics/fans_statics.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchPage(),
    CreateGroupPage()
    // RevenueStatisticsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedFontSize: 0,
          selectedFontSize: 0,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? SvgPicture.asset(
                      homeIcon,
                      colorFilter:
                          ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                    )
                  : SvgPicture.asset(homeIcon),
              //  Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? SvgPicture.asset(
                      chatIcon,
                      colorFilter:
                          ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                    )
                  : SvgPicture.asset(
                      chatIcon,
                    ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? SvgPicture.asset(
                      profileIcon,
                      colorFilter:
                          ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                    )
                  : SvgPicture.asset(profileIcon),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          // selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
