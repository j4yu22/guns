import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final List<String> weaponPresets;
  final List<String> ammoPresets;
  final String selectedWeapon;
  final String selectedAmmo;
  final void Function(String?) onWeaponChanged;
  final void Function(String?) onAmmoChanged;
  final VoidCallback onBack;
  final VoidCallback onSettings;

  const Header({
    super.key,
    required this.weaponPresets,
    required this.ammoPresets,
    required this.selectedWeapon,
    required this.selectedAmmo,
    required this.onWeaponChanged,
    required this.onAmmoChanged,
    required this.onBack,
    required this.onSettings,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: onBack,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: selectedWeapon,
                  onChanged: onWeaponChanged,
                  items: weaponPresets
                      .map((w) => DropdownMenuItem(
                            value: w,
                            child: Text(w),
                          ))
                      .toList(),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: selectedAmmo,
                  onChanged: onAmmoChanged,
                  items: ammoPresets
                      .map((a) => DropdownMenuItem(
                            value: a,
                            child: Text(a),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: onSettings,
          ),
        ],
      ),
    );
  }
}
