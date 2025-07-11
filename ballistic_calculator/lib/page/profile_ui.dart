import 'package:flutter/material.dart';
import '../ui/footer.dart';
import '../ui/settings.dart'; // Optional: if you plan to navigate to settings

class ProfileUI extends StatefulWidget {
  const ProfileUI({super.key});

  @override
  State<ProfileUI> createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> weaponProfiles = ['AR-15 16in', 'Remington 700', 'Mk12 Mod1'];
  List<String> ammoProfiles = ['5.56 55gr FMJ', '308 168gr ELD', '6.5CM 140gr'];
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _goToNewProfile(bool isWeapon) {
    // Replace with your actual routing logic
    Navigator.pushNamed(context, isWeapon ? '/new_weapon' : '/new_ammo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            // Custom Header with Tabs
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: TabBar(
                      controller: _tabController,
                      tabs: const [
                        Tab(child: Text("Weapon")),
                        Tab(child: Text("Ammo")),
                      ],
                      indicatorColor: Colors.black,
                      labelColor: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      // Placeholder for settings page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Scaffold(
                            appBar: AppBar(title: const Text('Settings (Placeholder)')),
                            body: const Center(child: Text('Settings page coming soon!')),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Tab content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildProfileList(weaponProfiles, isWeapon: true),
                  _buildProfileList(ammoProfiles, isWeapon: false),
                ],
              ),
            ),

            // Footer
            Footer(
              currentIndex: 3, // assuming this is the 4th tab
              onTap: (index) {
                // Handle footer tab tap, e.g., navigate to the selected page
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileList(List<String> profiles, {required bool isWeapon}) {
    return ListView.builder(
      itemCount: profiles.length + 1,
      itemBuilder: (context, index) {
        if (index < profiles.length) {
          return ListTile(
            title: Text(profiles[index]),
            onTap: () {
              // Handle selecting an existing profile
            },
          );
        } else {
          return ListTile(
            title: const Text("Create new..."),
            leading: const Icon(Icons.add),
            onTap: () => _goToNewProfile(isWeapon),
          );
        }
      },
    );
  }
}
