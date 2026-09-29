import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkMode = false;
  bool _locationServices = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "App Preferences",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      activeTrackColor: Colors.green,
                      title: const Text("Push Notifications"),
                      subtitle: const Text("Receive app alerts and updates"),
                      secondary: const Icon(Icons.notifications_active_outlined,
                          color: Colors.green),
                      value: _notificationsEnabled,
                      onChanged: (val) {
                        setState(() {
                          _notificationsEnabled = val;
                        });
                      },
                    ),
                    const Divider(height: 1),
                    SwitchListTile(
                      activeTrackColor: Colors.green,
                      title: const Text("Dark Theme"),
                      subtitle: const Text("Enable dark mode theme"),
                      secondary: const Icon(Icons.dark_mode_outlined,
                          color: Colors.green),
                      value: _darkMode,
                      onChanged: (val) {
                        setState(() {
                          _darkMode = val;
                        });
                      },
                    ),
                    const Divider(height: 1),
                    SwitchListTile(
                      activeTrackColor: Colors.green,
                      title: const Text("Location Services"),
                      subtitle: const Text("Allow app to access location"),
                      secondary: const Icon(Icons.location_on_outlined,
                          color: Colors.green),
                      value: _locationServices,
                      onChanged: (val) {
                        setState(() {
                          _locationServices = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Save Settings & Back Button
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Settings saved successfully!"),
                            backgroundColor: Colors.green,
                          ),
                        );
                        // Return to previous screen
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.save),
                      label: const Text("Save & Back"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Pop back to previous screen
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.cancel_outlined),
                      label: const Text("Cancel"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.green.shade800,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
