import 'package:flutter/material.dart';
import 'custom_drawer.dart';
import 'humidity.dart';
import 'noise.dart';
import 'temperature.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _buttonIndex = 0;
  final _widgets = [
    TemperatureTab(),
    HumidityTab(),
    NoiseTab(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
            icon: Icon(Icons.account_circle_rounded),
          ),
        ],
        backgroundColor: Colors.blue[300],
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      endDrawer: const NavigationDrawer(),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue[200],
          ),
          margin: const EdgeInsets.all(15),
          child: Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _buttonIndex = 0;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: _buttonIndex == 0
                              ? Colors.blue[900]
                              : Colors.blue[400],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "Temperature",
                            style: TextStyle(
                                fontSize: _buttonIndex == 0 ? 14 : 14,
                                fontWeight: FontWeight.bold,
                                color: _buttonIndex == 0
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _buttonIndex = 1;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: _buttonIndex == 1
                              ? Colors.blue[900]
                              : Colors.blue[400],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "Humidity",
                            style: TextStyle(
                                fontSize: _buttonIndex == 1 ? 16 : 14,
                                fontWeight: FontWeight.bold,
                                color: _buttonIndex == 1
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _buttonIndex = 2;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: _buttonIndex == 2
                              ? Colors.blue[900]
                              : Colors.blue[400],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "Noise",
                            style: TextStyle(
                                fontSize: _buttonIndex == 2 ? 16 : 14,
                                fontWeight: FontWeight.bold,
                                color: _buttonIndex == 2
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                _widgets[_buttonIndex],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        color: Colors.blue[300],
        height: 190,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: const Column(
          children: [
            const SizedBox(height: 30),
            const Icon(
              Icons.account_circle_rounded,
              size: 80,
              color: Colors.white,
            ),
            const SizedBox(height: 12),
            Text(
              'Account Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        child: const Wrap(
          runSpacing: 0,
          children: [
            Divider(color: Colors.black),
            ListTile(
              trailing: const Icon(Icons.account_circle_outlined),
              title: const Text(
                'Username:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Text('Juan Dela Cruz'),
            ),
            Divider(color: Colors.black),
            ListTile(
              trailing: const Icon(Icons.email_outlined),
              title: const Text(
                'Email Address:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Text('juandelacruz@gmail.com'),
            ),
            Divider(color: Colors.black),
            ListTile(
              trailing: const Icon(Icons.password_outlined),
              title: const Text(
                'Password:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Text('••••••••'),
            ),
          ],
        ),
      );
}
