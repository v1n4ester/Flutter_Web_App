import 'package:flutter_web/widgets/bottom_bar.dart';
import 'package:flutter_web/widgets/carousel.dart';
import 'package:flutter_web/widgets/featured_heading.dart';
import 'package:flutter_web/widgets/featured_tiles.dart';
import 'package:flutter_web/widgets/floating_quick_access_bar.dart';
import 'package:flutter_web/widgets/main_heading.dart';
import 'package:flutter_web/widgets/menu_drawer.dart';
import 'package:flutter_web/widgets/responsive.dart';
import 'package:flutter_web/widgets/top_bar_contents.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      drawer: MenuDrawer(),
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
            iconTheme: IconThemeData(color: Colors.blue),
              backgroundColor: Colors.white.withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Author',
                style: TextStyle(
                  color: Color(0xFF077bd7),
                  fontSize: 26,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 70),
              child: TopBarContents(_opacity),
            ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: SizedBox(
                    height: screenSize.height * 0.65,
                    width: screenSize.width,
                    child: Image.asset(
                      'assets/images/background.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    FloatingQuickAccessBar(screenSize: screenSize),
                    FeaturedHeading(screenSize: screenSize),
                    FeaturedTiles(screenSize: screenSize),
                    MainHeading(screenSize: screenSize),
                    MainCarousel(),
                    SizedBox(height: screenSize.height / 10),
                    BottomBar(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
