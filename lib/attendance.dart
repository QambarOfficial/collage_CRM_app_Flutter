import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  late List<String> students;
  late List<bool> attendanceList;

  @override
  void initState() {
    super.initState();
    students = generateStudentNames(20);
    attendanceList = List.filled(students.length, false);
  }

  List<String> generateStudentNames(int count) {
    List<String> names = [];
    for (int i = 1; i <= count; i++) {
      names.add('Student $i');
    }
    return names;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 7,
        title: const Text(
          'BCA Section-C (20)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.yellowAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle submit logic here
                // You can use attendanceList to submit data
                print('Attendance submitted: $attendanceList');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.pink,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          // Add the following line to set the color of the segmented buttons
          toggleButtonsTheme: const ToggleButtonsThemeData(
            color: Colors.pink, // Change this color to your desired color
          ),
        ),
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5.0,
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: ListTile(
                tileColor: Colors.white,
                title: Row(
                  children: [
                    Text(
                      students[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    SegmentedButton<bool>(
                      segments: const <ButtonSegment<bool>>[
                        ButtonSegment<bool>(
                          value: true,
                          label: Text('P'),
                        ),
                        ButtonSegment<bool>(
                          value: false,
                          label: Text('A'),
                        ),
                      ],
                      selected: {attendanceList[index]},
                      onSelectionChanged: (Set<bool> newSelection) {
                        setState(() {
                          attendanceList[index] = newSelection.first;
                        });
                      },
                      multiSelectionEnabled: false,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
