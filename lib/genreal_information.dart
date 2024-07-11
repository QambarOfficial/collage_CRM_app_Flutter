import 'package:flutter/material.dart';

class AboutDevScreen extends StatefulWidget {
  const AboutDevScreen({super.key, required this.title});

  final String title;

  @override
  _AboutDevScreenState createState() => _AboutDevScreenState();
}

class _AboutDevScreenState extends State<AboutDevScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 0, 255, 8),
            Color.fromARGB(255, 0, 129, 39),
          ], begin: Alignment.topCenter, end: Alignment.center)),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: height / 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: const AssetImage('assets/qambar1.png'),
                        radius: height / 10,
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      const Text(
                        'Qambar Abbas',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Developer',
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 2.2),
                child: Container(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: height / 2.6, left: width / 20, right: width / 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: 2.0,
                                offset: Offset(0.0, 2.0))
                          ]),
                      child: Padding(
                        padding: EdgeInsets.all(width / 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              headerChild('Assingments', 114),
                              headerChild('Marks', 1205),
                              headerChild('backlogs', 0),
                            ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height / 20),
                      child: Column(
                        children: <Widget>[
                          infoChild(
                              width, Icons.email, 'qambarabbas54325@gmail.com'),
                          infoChild(width, Icons.call, '+91-8510842558'),
                          infoChild(width, Icons.group_add, 'Assing Task'),
                          infoChild(width, Icons.chat_bubble, 'Massage'),
                          Padding(
                            padding: EdgeInsets.only(top: height / 30),
                            child: Container(
                              width: width / 3,
                              height: height / 20,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF26CBE6),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(height / 40)),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black87,
                                        blurRadius: 2.0,
                                        offset: Offset(0.0, 1.0))
                                  ]),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Center(
                                  child: Text('Go Back',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget headerChild(String header, int value) => Expanded(
          child: Column(
        children: <Widget>[
          Text(header),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            '$value',
            style: const TextStyle(
                fontSize: 14.0,
                color: Color.fromARGB(255, 0, 255, 106),
                fontWeight: FontWeight.bold),
          )
        ],
      ));

  Widget infoChild(double width, IconData icon, data) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: width / 10,
              ),
              Icon(
                icon,
                color: const Color.fromARGB(255, 0, 123, 16),
                size: 36.0,
              ),
              SizedBox(
                width: width / 20,
              ),
              Text(data)
            ],
          ),
          onTap: () {
            print('Info Object selected');
          },
        ),
      );
}
