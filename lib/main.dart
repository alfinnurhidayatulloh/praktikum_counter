
import 'package:flutter/material.dart';
import 'widgets/counter_display.dart';
import 'widgets/counter_buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noir Counter',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF101113),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('Counter dimulai');
  }

  void tambahCounter() {
    setState(() {
      counter++;
    });
  }

  void kurangCounter() {
    if (counter > 0) {
      setState(() {
        counter--;
      });
    }
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  void dispose() {
    debugPrint('Counter ditutup');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 28,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HEADER
                  Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xFF252629),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFF3A3B3E),
                          ),
                        ),
                        child: const Icon(
                          Icons.tune_rounded,
                          color: Color(0xFFE89A55),
                          size: 23,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NOIR / COUNTER',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'STATE MANAGEMENT',
                            style: TextStyle(
                              color: Color(0xFF77797E),
                              fontSize: 9,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 11,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF222925),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Color(0xFF7BC69B),
                              size: 7,
                            ),
                            SizedBox(width: 7),
                            Text(
                              'ACTIVE',
                              style: TextStyle(
                                fontSize: 9,
                                letterSpacing: 1,
                                color: Color(0xFF9BC9AA),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 55),

                  // JUDUL
                  const Text(
                    'SIMPLE.',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w900,
                      height: 1,
                      letterSpacing: -2,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'UNDER CONTROL.',
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.w300,
                      height: 1.4,
                      letterSpacing: -1,
                      color: Color(0xFFE89A55),
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Atur angka, kendalikan setiap perubahan.',
                    style: TextStyle(
                      color: Color(0xFF898B90),
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 38),

                  // DISPLAY COUNTER
                  CounterDisplay(counter: counter),

                  const SizedBox(height: 30),

                  // TOMBOL
                  CounterButtons(
                    onAdd: tambahCounter,
                    onSubtract: kurangCounter,
                    onReset: resetCounter,
                  ),

                  const SizedBox(height: 48),

                  // FOOTER
                  const Divider(
                    color: Color(0xFF303135),
                    thickness: 1,
                  ),

                  const SizedBox(height: 17),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'PRAKTIKUM MOBILE PROGRAMMING',
                        style: TextStyle(
                          fontSize: 9,
                          color: Color(0xFF73757A),
                          letterSpacing: 1,
                        ),
                      ),
                      Text(
                        'PERTEMUAN 07',
                        style: TextStyle(
                          fontSize: 9,
                          color: Color(0xFFE89A55),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
