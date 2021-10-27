import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Color _gridColor = Colors.blue;
  Color _listColor = Colors.grey;
  bool _isGridActive = true;
  IconData icon;
  Color color;
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: new Color(0xfff8faf8),
          elevation: 1,
          title: Text('Profile',style:TextStyle(color: Colors.black)),
          actions: [
            IconButton(
              icon: Icon(Icons.list),
              color: Colors.black,
              onPressed: () {},
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Container(
                      width: 110.0.w,
                      height: 110.0.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0.r),
                        image: DecorationImage(image: AssetImage('assets/no_image.png'), fit: BoxFit.cover),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[],
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0, left: 20.0, right: 20.0),
                          child: Container(
                            width: 330.0.w,
                            height: 60.0.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(color: Colors.grey)),
                            child: Center(
                              child: Text('Edit Profile', style: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 30.0),
              child: Text("你的名字",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    child: Icon(
                      Icons.grid_on,
                      color: _gridColor,
                    ),
                    onTap: () {
                      setState(() {
                        _isGridActive = true;
                        _gridColor = Colors.blue;
                        _listColor = Colors.grey;
                      });
                    },
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.stay_current_portrait,
                      color: _listColor,
                    ),
                    onTap: () {
                      setState(() {
                        _isGridActive = false;
                        _listColor = Colors.blue;
                        _gridColor = Colors.grey;
                      });
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Divider(),
            ),
          ],
        )
      ),
    );
  }
}
