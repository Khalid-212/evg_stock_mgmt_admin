import 'package:evg_stock_mgmt_admin/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class AddInventory extends StatefulWidget {
  const AddInventory({super.key});

  @override
  State<AddInventory> createState() => _AddInventoryState();
}

class _AddInventoryState extends State<AddInventory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text(
                  "Add Inventory",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
              // form fields for adding inventory
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    const CustomInput(
                      cardWidth: 350,
                      hintText: 'Enter product name',
                      icon: Icons.shopping_bag,
                      obscureText: false,
                    ),
                    const SizedBox(height: 24), // Space between fields
                    // Quantity field
                    const CustomInput(
                      cardWidth: 350,
                      hintText: 'Enter quantity',
                      icon: Icons.add,
                      obscureText: false,
                    ),
                    const SizedBox(height: 24), // Space between fields
                    // Price field
                    const CustomInput(
                      cardWidth: 350,
                      hintText: 'Enter price',
                      icon: Icons.money,
                      obscureText: false,
                    ),
                    const SizedBox(height: 24), // Space between fields
                    // Description field
                    const CustomInput(
                      cardWidth: 350,
                      hintText: 'Enter description',
                      icon: Icons.description,
                      obscureText: false,
                    ),
                    const SizedBox(height: 24), // Space between fields
                    // Category dropdown field
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: SizedBox(
                        width: 350,
                        child: DropdownButton(
                          items: const [
                            DropdownMenuItem(
                              child: Text('Category 1'),
                              value: 'Category 1',
                            ),
                            DropdownMenuItem(
                              child: Text('Category 2'),
                              value: 'Category 2',
                            ),
                            DropdownMenuItem(
                              child: Text('Category 3'),
                              value: 'Category 3',
                            ),
                          ],
                          onChanged: (value) {},
                          hint: const Text('Select category'),
                        ),
                      ),
                    ),
                    // image upload field
                    Text("image upload"),

                    const SizedBox(height: 24), // Space between fields
                    Container(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, // Text color
                            backgroundColor: Colors.blue, // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // Rounded square
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Add'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
