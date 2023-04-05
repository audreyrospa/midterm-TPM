import 'package:flutter/material.dart';

class DatarScreen extends StatelessWidget {
  const DatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Figures'),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Trapezoid'),
            onTap: () {
              Navigator.pushNamed(context, '/trapesium');
            },
          ),
          ListTile(
            title: const Text('Tube'),
            onTap: () {
              Navigator.pushNamed(context, '/tabung');
            },
          ),
        ],
      ),
    );
  }
}

class TrapesiumScreen extends StatefulWidget {
  const TrapesiumScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TrapesiumScreenState createState() => _TrapesiumScreenState();
}

class _TrapesiumScreenState extends State<TrapesiumScreen> {
  TextEditingController alasController = TextEditingController();
  TextEditingController atasController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();
  double luas = 0;
  double keliling = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Trapezoid'),
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: alasController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                hintText: 'Insert Base',
            ),
          ),
              const SizedBox(height: 16.0),
              TextField(
                controller: atasController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                hintText: 'Insert Above',
              ),
          ),
              const SizedBox(height: 16.0),
              TextField(
                controller: tinggiController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                hintText: 'Insert Height',
              ),
          ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  double alas = double.parse(alasController.text);
                  double atas = double.parse(atasController.text);
                  double tinggi = double.parse(tinggiController.text);
                  double sisiMiring = ((atas - alas) / 2).abs();
                  luas = ((alas + atas) * tinggi) / 2;
                  keliling = alas + atas + (2 * sisiMiring);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Calculation Result'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Area: $luas'),
                    const SizedBox(height: 8.0),
                    Text('Circumference: $keliling'),
                  ],
                ),
                  actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
                child: const Text('Calculate'),
      ),
    ],
    ),
        ),
    );
  }
}

class TabungScreen extends StatefulWidget {
  const TabungScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TabungScreenState createState() => _TabungScreenState();
}

class _TabungScreenState extends State<TabungScreen> {
  TextEditingController jariController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();
  double luas = 0;
  double keliling = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tube'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: jariController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Insert Radius',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: tinggiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Insert Height',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                double jari = double.parse(jariController.text);
                double tinggi = double.parse(tinggiController.text);
                luas = (2 * 3.14 * jari * tinggi) + (2 * 3.14 * jari * jari);
                keliling = 2 * 3.14 * jari * (jari + tinggi);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Calculation Result'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Area: $luas'),
                          const SizedBox(height: 8.0),
                          Text('Circumference: $keliling'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
