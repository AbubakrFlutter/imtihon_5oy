import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview_plus/device_preview_plus.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[800],

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          Stack(
            children: [
              const Icon(CupertinoIcons.bell, color: Colors.white, size: 24),
              Positioned(
                right: 12,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 2),
          Stack(
            children: [
              const Icon(Icons.send, color: Colors.white, size: 24),
              Positioned(
                right: 12,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 5),
          Container(
            margin: EdgeInsets.only(right: 16),
            width: 120,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                colors: [
                  Colors.deepOrange,
                  Colors.deepOrange,
                  Colors.orangeAccent,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.add_circled,
                    color: Colors.white,
                    size: 24,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Add Photo",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        backgroundColor: Colors.grey[800],
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            width: 100,
            height: 35,
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(CupertinoIcons.search, color: Colors.white, size: 20),
                SizedBox(width: 5),

                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "search",
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      drawer: Drawer(
        backgroundColor: Color(0xFF262626),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
              decoration: BoxDecoration(color: Color(0xFF262626)),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://static.xx.fbcdn.net/assets/?set=help_center_about_page_illustrations&name=desktop-instagram-gradient-logo&density=1",
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Instagram",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/6858/6858504.png',
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Anvarov Abubakr',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '@Uzbek0770',
                    style: TextStyle(color: Colors.grey[400], fontSize: 14),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatColumn('9', 'Posts'),
                      Container(width: 1, height: 30, color: Colors.grey[700]),
                      _buildStatColumn('9.3M', 'Foll'),
                      Container(width: 1, height: 30, color: Colors.grey[700]),
                      _buildStatColumn('1098', 'Null'),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 10),
                children: [
                  _buildMenuItem(Icons.grid_on, 'Feed', 0),
                  _buildMenuItem(Icons.search, 'Explore', 1),
                  _buildMenuItem(
                    Icons.notifications_outlined,
                    'Notifications',
                    2,
                  ),
                  _buildMenuItem(Icons.send_outlined, 'Direct', 3),
                  _buildMenuItem(Icons.bar_chart, 'Stats', 4),
                  _buildMenuItem(Icons.settings_outlined, 'Settings', 5),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stories Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Stories',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.play_circle_outline,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Watch all',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Stories List
            // Stories List
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildAddStoryItem(),
                  _buildStoryItem(
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
                  ),
                  _buildStoryItem(
                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
                  ),
                  _buildStoryItem(
                    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
                  ),
                  _buildStoryItem(
                    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80',
                  ),
                  _buildStoryItem(
                    'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6',
                  ),
                  _buildStoryItem(
                    'https://images.unsplash.com/photo-1524504388940-b1c1722653e1',
                  ),
                  _buildStoryItem(
                    'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
                  ),
                  _buildStoryItem(
                    'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df',
                  ),
                  _buildStoryItem(
                    'https://images.unsplash.com/photo-1517841905240-472988babdf9',
                  ),
                  _buildStoryItem(
                    'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
                  ),
                  _buildStoryItem(
                    'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04',
                  ),
                  _buildStoryItem(
                    'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
                  ),
                  _buildStoryItem(
                    'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d',
                  ),
                  _buildStoryItem(
                    'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126',
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Feed Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Feed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Latest',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Popular',
                        style: TextStyle(color: Colors.grey[500], fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 15),

            // Agar package o'rnatishni xohlamasangiz
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Chap ustun
                        Expanded(
                          child: Column(
                            children: [
                              _buildFeedItem(
                                'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
                                'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
                                1120,
                                74,
                                180,
                              ),
                              SizedBox(height: 10),
                              _buildFeedItem(
                                'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05',
                                'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
                                345,
                                28,
                                250,
                              ),
                              SizedBox(height: 10),
                              _buildFeedItem(
                                'https://images.unsplash.com/photo-1511884642898-4c92249e20b6',
                                'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6',
                                892,
                                67,
                                200,
                              ),
                              SizedBox(height: 10),
                              _buildFeedItem(
                                'https://images.unsplash.com/photo-1502139214982-d0ad755818d8',
                                'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
                                512,
                                38,
                                220,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        // O'ng ustun
                        Expanded(
                          child: Column(
                            children: [
                              _buildFeedItem(
                                'https://images.unsplash.com/photo-1469474968028-56623f02e42e',
                                'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
                                95,
                                12,
                                120,
                              ),
                              SizedBox(height: 10),
                              _buildFeedItem(
                                'https://images.unsplash.com/photo-1472214103451-9374bd1c798e',
                                'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
                                567,
                                43,
                                280,
                              ),
                              SizedBox(height: 10),
                              _buildFeedItem(
                                'https://images.unsplash.com/photo-1501594907352-04cda38ebc29',
                                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80',
                                423,
                                31,
                                240,
                              ),
                              SizedBox(height: 10),
                              _buildFeedItem(
                                'https://images.unsplash.com/photo-1426604966848-d7adac402bff',
                                'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
                                756,
                                52,
                                190,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Add Story tugmasi
  Widget _buildAddStoryItem() {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add, color: Colors.white, size: 35),
          ),
        ],
      ),
    );
  }

  // Story Item
  Widget _buildStoryItem(String imageUrl) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.deepOrange, Colors.pink],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[800]!, width: 3),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Feed Item
  // Feed Item - balandlik parametri qo'shildi
  Widget _buildFeedItem(
    String postImage,
    String profileImage,
    int likes,
    int comments,
    double height, // yangi parametr
  ) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[850],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post Image
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(postImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Bottom Info
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(profileImage),
                ),
                Spacer(),
                Icon(Icons.favorite_border, color: Colors.white, size: 20),
                SizedBox(width: 4),
                Text(
                  '$likes',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(width: 10),
                Icon(Icons.chat_bubble_outline, color: Colors.white, size: 20),
                SizedBox(width: 4),
                Text(
                  '$comments',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.grey[400], fontSize: 12)),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, int index) {
    bool isSelected = selectedIndex == index;

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Color(0xFFD64545) : Colors.white,
        size: 26,
      ),
      title: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    );
  }
}
