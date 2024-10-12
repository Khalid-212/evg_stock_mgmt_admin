import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:evg_stock_mgmt_admin/widgets/stat_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Dashboard",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
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
          const Wrap(
            children: [
              StatCard(
                icon: Icons.attach_money,
                stat: "100",
                isMoney: true,
                iconColor: Colors.white,
                cardColor: Color(0xFF0080F6),
                textColor: Color.fromARGB(255, 255, 255, 255),
                description: "Revenue",
              ),
              StatCard(
                icon: Icons.money,
                stat: "100",
                isMoney: true,
                iconColor: Colors.blue,
                cardColor: Color(0xFFECF5EE),
                textColor: Color(0xFF0080F6),
                description: "Profit",
              ),
              StatCard(
                icon: Icons.inventory_2_outlined,
                stat: "100",
                isMoney: false,
                iconColor: Colors.blue,
                cardColor: Color.fromARGB(255, 224, 225, 245),
                textColor: Colors.blue,
                description: "Total Calls",
              ),
              StatCard(
                icon: Icons.description_outlined,
                stat: "100",
                isMoney: false,
                iconColor: Colors.white,
                cardColor: Color(0xFF01B2EB),
                textColor: Colors.white,
                description: "Total Calls",
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("History"),
                    TextButton(
                      onPressed: () {
                        // Handle the 'See All' button click
                        print("See All button clicked");
                      },
                      child: const Text("See All"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.ac_unit_outlined,
                        ),
                      ),
                      Text(
                        "1000 ETB",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
