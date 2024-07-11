import 'dart:async';

import 'package:flutter/material.dart';

class niu extends StatefulWidget {
  const niu({super.key});

  @override
  _niuState createState() => _niuState();
}

class _niuState extends State<niu> {
  final List<String> imagePaths = [
    'assets/a1.png',
    'assets/a2.jpg',
    'assets/a3.jpg',
    'assets/a4.jpg',
  ];

  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      // initialPage: imagePaths.length * 2,
      viewportFraction: 0.8,
    );
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2 * imagePaths.length - 1) {
        _currentPage++;
      } else {
        _currentPage = imagePaths.length;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collage Campus'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.pinkAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to Collage Campus!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Our Gallery:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6.0),
            // Use PageView for the image slideshow
            SizedBox(
              height: 200.0,
              // Adjust the height as needed
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3 * imagePaths.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          imagePaths[index % imagePaths.length],
                          width: 400,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'About Us:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Noida International University is established by U.P. LEGISLATURE ACT NO. 27 OF 2010 and under Section 2(f) of the UGC Act, 1956.\n\nA world Class University sponsored by the Maruti Educational Trust. The lush green campus of 75 acres with its uniquely designed architecture stands out as an infrastructure. The campus is strategically located near the Yamuna Expressway educational hub in Gautam Budh Nagar, Greater Noida.\n\nThe University through its 13 schools is offering various multi-disciplinary  programmes in varied streams of Engineering, Management, Law, Pharmacy, Medical and Social Sciences. The students from more than 54 Nations place faith in the educational curriculum of the University. The Petals leading towards a star is an embodiment of the University cherished mission to provide education beyond the boundaries and to felicitate the students and faculty to achieve pinnacles of success throughout the world.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Featured Courses:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'B.Tech:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const Text(
                'Bachelor of Technology (BTech) is a professional undergraduate engineering degree programme awarded to candidates after they complete four years of study in the field.In the School of Engineering and Technology, apart from regular Teaching Learning Process, Workshops, Model Exhibitions, Special Lecture Series, Seminars, Projects and Technical Paper Presentation etc. are held to support the Engineering Education.'),
            const SizedBox(height: 10.0),
            const Text(
              'MBBS:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const Text(
                'niu offers a great academic edge to achieve excellence in all walks of life.'),
            const SizedBox(height: 10.0),
            const Text(
              'MBA:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const Text(
                'Two year of flagship Industry-driven program with innovative teaching pedagogy comprising experiential learning, simulations and case-based approach.'),
            const SizedBox(height: 10.0),
            const Text(
              'LLB:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const Text(
                'Unmatched opportunities to study law degree in an innovative, rigorous and collaborative environment.'),
            const SizedBox(height: 10.0),
            const Text(
              'Ph.D:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const Text(
                'Fulfill your dream of higher studies with multidisciplinary research driven University.'),
          ],
        ),
      ),
    );
  }
}
