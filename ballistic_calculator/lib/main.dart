import 'package:flutter/material.dart';
import 'page/home_ui.dart';
import 'page/target_ui.dart';
import 'page/chart_ui.dart';
import 'page/profile_ui.dart';
import 'ui/footer.dart';

void main() {
  runApp(const BallisticCalculatorApp());
}

class BallisticCalculatorApp extends StatelessWidget {
  const BallisticCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ballistic Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const MainLayout(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    // placeholder values for now
    HomeUI(
    weaponPresets: const ['Default Rifle'],
    ammoPresets: const ['Default Ammo'],
    selectedWeapon: 'Default Rifle',
    selectedAmmo: 'Default Ammo',
    onWeaponChanged: (_) {},
    onAmmoChanged: (_) {},
    onBack: () {},
    onSettings: () {},
    onFooterTap: (_) {},
    currentIndex: 0,
    onCalibratePressed: () {},
    onSingleTargetPressed: () {},
    onDopeCardPressed: () {},
    ),
    TargetUI(),
    ChartUI(),
    ProfileUI(),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

 @override
  Widget build(BuildContext context) {
    return _pages[_selectedIndex];
  }
}
