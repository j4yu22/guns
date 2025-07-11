import 'package:flutter/material.dart';

class ChartUI extends StatelessWidget {
  const ChartUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(80),
              minScale: 0.5,
              maxScale: 3,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Range (yd)')),
                      DataColumn(label: Text('Velocity (fps)')),
                      DataColumn(label: Text('Energy (ft-lbf)')),
                      DataColumn(label: Text('Vertical MOA')),
                      DataColumn(label: Text('Horizontal MOA')),
                    ],
                    rows: const [
                      // Replace this with data from chart.dart
                      DataRow(cells: [
                        DataCell(Text('100')),
                        DataCell(Text('2650')),
                        DataCell(Text('2800')),
                        DataCell(Text('1.5')),
                        DataCell(Text('0.3')),
                      ]),
                      // Add more rows dynamically
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 12,
              left: 12,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
