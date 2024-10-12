import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // For displaying graphs
import 'package:intl/intl.dart'; // For formatting date

class Analytics extends StatefulWidget {
  const Analytics({super.key});

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  DateTime? startDate;
  DateTime? endDate;

  // To store the selected metric for the graph
  String selectedMetric = "Revenue"; // Default to Revenue
  double selectedValue = 1000; // Example initial value for Revenue
  List<double> graphData = [10, 20, 30, 40, 50]; // Dummy data for the graph

  // Method to update graph data and selected value
  void updateData(String metric) {
    setState(() {
      selectedMetric = metric;

      // Update the data and value for each card
      switch (metric) {
        case 'Revenue':
          selectedValue = 1000; // Example value
          graphData = [10, 20, 30, 40, 50]; // Dummy graph data for Revenue
          break;
        case 'Profit':
          selectedValue = 800; // Example value
          graphData = [5, 15, 25, 35, 45]; // Dummy graph data for Profit
          break;
        case 'Sales':
          selectedValue = 1200; // Example value
          graphData = [12, 22, 32, 42, 52]; // Dummy graph data for Sales
          break;
        case 'Receivables':
          selectedValue = 600; // Example value
          graphData = [6, 16, 26, 36, 46]; // Dummy graph data for Receivables
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Analytics",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                // Date picker button
                TextButton(
                  onPressed: () {
                    showCustomDateRangePicker(
                      context,
                      dismissible: true,
                      minimumDate:
                          DateTime.now().subtract(const Duration(days: 30)),
                      maximumDate: DateTime.now().add(const Duration(days: 30)),
                      endDate: endDate,
                      startDate: startDate,
                      backgroundColor: Colors.white,
                      primaryColor: Colors.green,
                      onApplyClick: (start, end) {
                        setState(() {
                          startDate = start;
                          endDate = end;
                        });
                      },
                      onCancelClick: () {
                        setState(() {
                          startDate = null;
                          endDate = null;
                        });
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: startDate != null && endDate != null
                        ? Text(
                            '${DateFormat('MMM d').format(startDate!)} - ${DateFormat('MMM d').format(endDate!)}',
                            style: const TextStyle(color: Colors.white),
                          )
                        : const Icon(Icons.date_range_outlined,
                            color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          // Display selected value above the graph
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '$selectedMetric: $selectedValue',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Graph Placeholder
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(graphData.length,
                        (index) => FlSpot(index.toDouble(), graphData[index])),
                    isCurved: true,
                    // spots: [Colors.blue],
                    barWidth: 3,
                  ),
                ],
              ),
            ),
          ),

          const Divider(height: 30, thickness: 1),

          // Cards Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                // First Row (Revenue & Profit)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildMetricCard("Revenue", Colors.blue, selectedMetric),
                    _buildMetricCard("Profit", Colors.green, selectedMetric),
                  ],
                ),
                const SizedBox(height: 10),

                // Second Row (Sales & Receivables)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildMetricCard("Sales", Colors.orange, selectedMetric),
                    _buildMetricCard("Receivables", Colors.red, selectedMetric),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build the metric card
  Widget _buildMetricCard(String title, Color color, String selected) {
    return GestureDetector(
      onTap: () => updateData(title),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: selected == title ? color : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.attach_money,
              color: selected == title ? Colors.white : color,
              size: 30,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: selected == title ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
