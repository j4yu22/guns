import 'package:flutter/material.dart';
import '../ui/header.dart';
import '../ui/footer.dart';
// You might later create something like: import '../widgets/moa_graph.dart';

class TargetUI extends StatelessWidget {
  const TargetUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(
            weaponPresets: const [],
            ammoPresets: const [],
            selectedWeapon: '',
            selectedAmmo: '',
            onWeaponChanged: (value) {},
            onAmmoChanged: (value) {},
            onBack: () {},
            onSettings: () {},
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Placeholder for MOA graph
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: Colors.grey[300],
                            alignment: Alignment.center,
                            child: const Text("Graph of MOA adjustment"),
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Text adjustments
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: const [
                              Text("Vertical Adjustment"),
                              SizedBox(height: 12),
                              Text("Horizontal Adjustment"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Range to target + unit
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Range to Target',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 1,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Unit',
                            border: OutlineInputBorder(),
                          ),
                          items: const [
                            DropdownMenuItem(value: 'yards', child: Text('Yards')),
                            DropdownMenuItem(value: 'meters', child: Text('Meters')),
                          ],
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Calibrate button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Add calibrate logic
                      },
                      child: const Text("Calibrate"),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Footer(
            currentIndex: 0,
            onTap: (index) {
              // TODO: Handle footer tap
            },
          ),
        ],
      ),
    );
  }
}
