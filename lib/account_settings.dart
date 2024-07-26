import 'package:flutter/material.dart';
import 'custom_drawer.dart';
import 'edit_info.dart'; // Import the new Edit Info page

class AccountSettingsPage extends StatefulWidget {
  final Map<String, dynamic>? user;

  const AccountSettingsPage({super.key, this.user});

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  String? _username;
  String? _email;

  @override
  void initState() {
    super.initState();

    // Initialize user data from the arguments with default values if null
    _username = widget.user?['username'] ?? 'Not Set';
    _email = widget.user?['email'] ?? 'Not Set';
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: const Text('Account Settings'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
            icon: const Icon(Icons.account_circle_rounded),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      endDrawer: const NavigationDrawer(),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue[200],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20), // Space from the app bar
              _buildEditableField(
                label: 'Username',
                value: _username!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditInfoPage(
                        initialValue: _username!,
                        fieldName: 'Username',
                        onSave: (newValue) {
                          setState(() {
                            _username = newValue;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              _buildEditableField(
                label: 'Email',
                value: _email!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditInfoPage(
                        initialValue: _email!,
                        fieldName: 'Email',
                        onSave: (newValue) {
                          setState(() {
                            _email = newValue;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              _buildEditableField(
                label: 'Password',
                value: '••••••••',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditInfoPage(
                        initialValue: '',
                        fieldName: 'Password',
                        isPassword: true,
                        onSave: (newValue) {
                          // Handle password change
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Changing your password will log you out anywhere this account is logged in.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 50, 50, 50),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(270, 50),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(value),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
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
