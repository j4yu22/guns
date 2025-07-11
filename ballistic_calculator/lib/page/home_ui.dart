import 'package:flutter/material.dart';
import '../ui/header.dart';
import '../ui/footer.dart';

class HomeUI extends StatelessWidget {
  final List<String> weaponPresets;
  final List<String> ammoPresets;
  final String selectedWeapon;
  final String selectedAmmo;
  final void Function(String?) onWeaponChanged;
  final void Function(String?) onAmmoChanged;
  final VoidCallback onBack;
  final VoidCallback onSettings;
  final void Function(int) onFooterTap;
  final int currentIndex;

  final VoidCallback onCalibratePressed;
  final VoidCallback onSingleTargetPressed;
  final VoidCallback onDopeCardPressed;

  const HomeUI({
    super.key,
    required this.weaponPresets,
    required this.ammoPresets,
    required this.selectedWeapon,
    required this.selectedAmmo,
    required this.onWeaponChanged,
    required this.onAmmoChanged,
    required this.onBack,
    required this.onSettings,
    required this.onFooterTap,
    required this.currentIndex,
    required this.onCalibratePressed,
    required this.onSingleTargetPressed,
    required this.onDopeCardPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(
            weaponPresets: weaponPresets,
            ammoPresets: ammoPresets,
            selectedWeapon: selectedWeapon,
            selectedAmmo: selectedAmmo,
            onWeaponChanged: onWeaponChanged,
            onAmmoChanged: onAmmoChanged,
            onBack: onBack,
            onSettings: onSettings,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onCalibratePressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              'Calibrate',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Column(
              children: [
                _buildLargeImageButton(
                  imageAsset: 'assets/images/single_target.jpg',
                  label: 'Single Target',
                  onPressed: onSingleTargetPressed,
                ),
                const SizedBox(height: 16),
                _buildLargeImageButton(
                  imageAsset: 'assets/images/dope_card.jpg',
                  label: 'Dope Card',
                  onPressed: onDopeCardPressed,
                ),
              ],
            ),
          ),
          Footer(
            currentIndex: currentIndex,
            onTap: onFooterTap,
          ),
        ],
      ),
    );
  }

  Widget _buildLargeImageButton({
    required String imageAsset,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageAsset),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
