import 'package:niu/admission.dart';
import 'package:niu/attendance.dart';
import 'package:niu/fees.dart';
import 'package:niu/genreal_information.dart';
import 'package:niu/niu.dart';
import 'package:niu/profile.dart';
import 'package:flutter/material.dart';
// import 'package:niu/timetable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
            .copyWith(secondary: Colors.greenAccent),
      ),
      debugShowCheckedModeBanner: false,
      home: MyClickableTilesScreen(
        tilesData: [
          TileData('niu   ', Icons.account_balance,
              [Colors.deepPurple, Colors.redAccent]),
          TileData('NIIMS', Icons.account_balance_outlined,
              [Colors.deepPurple, Colors.redAccent]),
          TileData('Admissions', Icons.groups,
              [Colors.deepPurple, Colors.cyanAccent]),
          TileData('Attendance', Icons.fact_check_outlined,
              [Colors.deepPurple, Colors.cyanAccent]),
          TileData('Fees', Icons.attach_money,
              [Colors.deepPurple, Colors.cyanAccent]),
          TileData('Time Table', Icons.calendar_view_month_sharp,
              [Colors.deepPurple, Colors.cyanAccent]),
          TileData('Exam Result', Icons.assignment,
              [Colors.deepPurple, Colors.cyanAccent]),
          TileData(
              'Teacher', Icons.person, [Colors.deepPurple, Colors.cyanAccent]),
          TileData(
              'Student', Icons.people, [Colors.deepPurple, Colors.cyanAccent]),
        ],
        appBarIconPath: 'assets/niu_logo.png',
      ),
    );
  }
}

class TileData {
  final String name;
  final IconData icon;
  final List<Color> gradientColors;

  TileData(
    this.name,
    this.icon,
    this.gradientColors,
  );
}

class MyClickableTilesScreen extends StatelessWidget {
  final List<TileData> tilesData;
  final String appBarIconPath;

  const MyClickableTilesScreen({
    super.key,
    required this.tilesData,
    required this.appBarIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        centerTitle: true,
        title: const Text(
          'Noida International University',
          style: TextStyle(
            fontFamily: 'Times New Roman',
            fontSize: 18,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 0, 90, 0), Colors.lightGreenAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 3.4,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 150, 0),
                    Colors.lightGreenAccent
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle drawer item tap
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutDevScreen(
                            title: 'Dev',
                          ),
                        ),
                      );
                    },
                    child: ClipOval(
                      // child: CircleAvatar(
                      //   radius: 60,
                      //   backgroundColor: Colors.green,
                      //   child: Icon(
                      //     Icons.person,
                      //     size: 100,
                      //   ),
                      child: Image.asset(
                        'assets/qambar1.png',
                        height: 120,
                        width: 120,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      // "USER",
                      "User",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 260),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyClickableTile(tilesData[0]),
                        Container(
                          height: 85, // Adjust the height as needed
                          width: 2, // Adjust the width as needed
                          color: Colors.grey,
                        ),
                        MyClickableTile(tilesData[1]),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.grey,
                    indent: 10,
                    endIndent: 10,
                  ),
                  ...tilesData.sublist(2).map((tileData) {
                    return MyClickableTile(tileData);
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClickableTile extends StatefulWidget {
  final TileData tileData;

  const MyClickableTile(this.tileData, {super.key});

  @override
  _MyClickableTileState createState() => _MyClickableTileState();
}

class _MyClickableTileState extends State<MyClickableTile> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isTapped = true;
        });
        _navigateToScreen(context);
      },
      onTapUp: (_) {
        setState(() {
          isTapped = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isTapped = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            colors: isTapped
                ? [
                    Colors.black,
                    Colors.white
                  ] // Change to the desired tapped colors
                : widget.tileData.gradientColors,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.tileData.icon,
                size: 55.0,
                color: Colors.white,
              ),
              const SizedBox(width: 8.0),
              Text(
                widget.tileData.name,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context) {
    // Implement navigation logic based on tileData.name
    switch (widget.tileData.name) {
      case 'niu   ':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const niu(),
          ),
        );
        break;
      case 'Admissions':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AdmissionForm(),
          ),
        );
        break;
      case 'Attendance':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AttendanceScreen(),
          ),
        );
        break;
      case 'Fees':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FeesScreen(),
          ),
        );
        break;
      case 'Time Table':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyApp(),
          ),
        );
        break;
      // Add cases for other tiles as needed
    }
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 0, 90, 0),
                  Colors.lightGreenAccent
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              image: DecorationImage(
                image: AssetImage('assets/niu_logo.png'),
                fit: BoxFit.contain,
              ),
            ),
            child: Text(
              'niu',
              style: TextStyle(
                fontFamily: 'Times New Roman',
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
          ListTile(
            title: const Text('Profile'),
            leading: const Icon(Icons.person),
            onTap: () {
              // Handle drawer item tap
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Dashboard'),
            leading: const Icon(Icons.dashboard),
            onTap: () {
              // Handle drawer item tap
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Academics'),
            leading: const Icon(Icons.school),
            onTap: () {
              // Handle drawer item tap
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Academic Calendar'),
            leading: const Icon(Icons.calendar_month),
            onTap: () {
              // Handle drawer item tap
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Grievance'),
            leading: const Icon(Icons.contact_phone_sharp),
            onTap: () {
              // Handle drawer item tap
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Transportation'),
            leading: const Icon(Icons.bus_alert),
            onTap: () {
              // Handle drawer item tap
              Navigator.pop(context);
            },
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text('About Developer'),
            leading: const Icon(Icons.info),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutDevScreen(
                    title: '',
                  ),
                ),
              );
            },
          ),
          // Add more ListTile items as needed
        ],
      ),
    );
  }
}
