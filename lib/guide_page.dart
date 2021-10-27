import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';

class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [HomePage(), ProfilePage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 55.w,
        selectedLabelStyle: TextStyle(fontSize: 0.sp, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 0.sp, fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: ""),
        ],
        onTap: (index) {
          setState(() {
            this._selectedIndex = index;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: this._selectedIndex,
      ),
    );
  }
}
