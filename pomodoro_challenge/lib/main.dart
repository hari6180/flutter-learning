import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: const Color(0xFFF4EDDB).withOpacity(0.5),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color.fromARGB(255, 255, 68, 68),
        ),
        cardColor: const Color(0xFFF4EDDB),
        scaffoldBackgroundColor: const Color.fromARGB(255, 106, 186, 255),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  int setSeconds = 0;
  bool isRunning = false;
  int totalPomodoros = 0;
  int totalRounds = 0;
  bool isRest = false;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0 && !isRest) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = setSeconds;
        if (totalPomodoros % 4 == 0) {
          totalRounds = totalRounds + 1;
          isRest = true;
          totalSeconds = 300;
        }
      });
      timer.cancel();
    } else if (totalSeconds == 0 && isRest) {
      setState(() {
        isRest = false;
        totalSeconds = setSeconds;
      });
      timer.cancel();
    } else if (totalSeconds != 0 && isRest) {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );

    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    setState(() {
      isRunning = false;
      totalSeconds = setSeconds;
    });
  }

  void onSetTime(int time) {
    setState(() {
      isRunning = false;
      totalSeconds = time;
      setSeconds = time;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isRest
          ? Theme.of(context).scaffoldBackgroundColor
          : Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              child: Text(
                isRest ? "POMOTIMER - REST TIME!" : "POMOTIMER",
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.topCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonBar(
                    children: <Widget>[
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll(
                            Theme.of(context).cardColor,
                          ),
                          side: MaterialStatePropertyAll(
                            BorderSide(
                              color: Theme.of(context).cardColor,
                              width: 1.5,
                              style: BorderStyle.solid,
                            ),
                          ),
                          minimumSize: const MaterialStatePropertyAll(
                            Size(70, 40),
                          ),
                        ),
                        onPressed: () => onSetTime(900),
                        child: const Text(
                          '15',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll(
                            Theme.of(context).cardColor,
                          ),
                          side: MaterialStatePropertyAll(
                            BorderSide(
                                color: Theme.of(context).cardColor,
                                width: 1.5,
                                style: BorderStyle.solid),
                          ),
                          minimumSize: const MaterialStatePropertyAll(
                            Size(70, 40),
                          ),
                        ),
                        onPressed: () => onSetTime(1200),
                        child: const Text(
                          '20',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll(
                            Theme.of(context).cardColor,
                          ),
                          side: MaterialStatePropertyAll(
                            BorderSide(
                                color: Theme.of(context).cardColor,
                                width: 1.5,
                                style: BorderStyle.solid),
                          ),
                          minimumSize: const MaterialStatePropertyAll(
                            Size(70, 40),
                          ),
                        ),
                        onPressed: () => onSetTime(1500),
                        child: const Text(
                          '25',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll(
                            Theme.of(context).cardColor,
                          ),
                          side: MaterialStatePropertyAll(
                            BorderSide(
                                color: Theme.of(context).cardColor,
                                width: 1.5,
                                style: BorderStyle.solid),
                          ),
                          minimumSize: const MaterialStatePropertyAll(
                            Size(70, 40),
                          ),
                        ),
                        onPressed: () => onSetTime(1800),
                        child: const Text(
                          '30',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll(
                            Theme.of(context).cardColor,
                          ),
                          side: MaterialStatePropertyAll(
                            BorderSide(
                                color: Theme.of(context).cardColor,
                                width: 1.5,
                                style: BorderStyle.solid),
                          ),
                          minimumSize: const MaterialStatePropertyAll(
                            Size(70, 40),
                          ),
                        ),
                        onPressed: () => onSetTime(2100),
                        child: const Text(
                          '35',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(
                      isRunning ? Icons.pause_circle : Icons.play_circle,
                    ),
                  ),
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: onResetPressed,
                    icon: const Icon(Icons.restart_alt_outlined),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$totalRounds/4',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'ROUND',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).cardColor,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$totalPomodoros/12',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'GOAL',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).cardColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
