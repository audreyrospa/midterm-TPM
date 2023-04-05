
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart';


class KalenderScreen extends StatefulWidget {
  const KalenderScreen({super.key});

  @override
  _KalenderScreenState createState() => _KalenderScreenState();
}

class _KalenderScreenState extends State<KalenderScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String timeZone = 'Asia/Jakarta';
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.addListener(() {
      setState(() {
        // Update the widget every time the animation updates
      });
    });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.stop(); // Stop the animation when the widget is removed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tz = getLocation(timeZone);
    var time = TZDateTime.from(now, tz);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalender'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hari: ${DateFormat('EEEE').format(time)}'),
            const SizedBox(height: 8.0),
            Text('Tanggal: ${DateFormat('dd MMMM yyyy').format(time)}'),
            const SizedBox(height: 8.0),
            Text('Waktu: ${DateFormat('HH:mm:ss').format(time)}'),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: timeZone,
                  items: const [
                    DropdownMenuItem(value: 'Asia/Jakarta', child: Text('WIB')),
                    DropdownMenuItem(value: 'Asia/Makassar', child: Text('WIT')),
                    DropdownMenuItem(value: 'Asia/Jayapura', child: Text('WITA')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      timeZone = value!;
                    });
                  }
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
