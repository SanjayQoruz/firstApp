import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DeliveryTimelinePage(),
    );
  }
}

class DeliveryTimelinePage extends StatefulWidget {
  @override
  _DeliveryTimelinePageState createState() => _DeliveryTimelinePageState();
}

class _DeliveryTimelinePageState extends State<DeliveryTimelinePage> {
  List<bool> isCheckedList = [true, true, true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Timeline'),
      ),
      body: Flexible(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Order ID: 123456',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              for (int i = 0; i < isCheckedList.length; i++)
                TimelineItem(
                  status: 'Status $i',
                  date: 'Jan ${i + 1}, 2023',
                  isChecked: isCheckedList[i],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimelineItem extends StatelessWidget {
  final String status;
  final String date;
  final bool isChecked;

  TimelineItem({
    required this.status,
    required this.date,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isChecked ? Colors.green : Colors.grey,
              ),
            ),
            Container(
              width: 2,
              height: 100,  // Adjust the height as needed
              color: Colors.black,
            ),
          ],
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              status,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(date),
          ],
        ),
        Container(
          height: 1,
          color: Colors.black,
        ),
      ],
    );
  }
}
