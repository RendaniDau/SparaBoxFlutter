import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  bool _isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Dashoard",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Messages",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Transactions",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Payments",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Branches",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
              ]),
        ),
      ),
    );
  }

  Widget dashboard(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      left: _isCollapsed ? 0 : 0.6 * screenWidth,
      right: _isCollapsed ? 0 : -0.2 * screenWidth,
      top: 0,
      bottom: 0,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: backgroundColor,
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: Icon(Icons.menu, color: Colors.white),
                        onTap: () {
                          setState(() {
                            if (_isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();
                            _isCollapsed = !_isCollapsed;
                          });
                        },
                      ),
                      Text(
                        "My Accounts",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      Icon(Icons.add_circle_outline, color: Colors.white),
                    ]),
                SizedBox(height: 50),
                Container(
                  height: 200,
                  child: PageView(
                    controller: PageController(viewportFraction: 0.8),
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        color: Colors.redAccent,
                        width: 100,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        color: Colors.blueAccent,
                        width: 100,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        color: Colors.greenAccent,
                        width: 100,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Recent Transactions", style: TextStyle(color: Colors.white, fontSize: 20),),
                SizedBox(
                  height: 5,
                ),
                /*ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("Macbook"),
                        subtitle: Text("Apple"),
                        trailing: Text("-1200"),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(height: 16);
                    },
                    itemCount: 3)*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
