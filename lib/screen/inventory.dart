import 'package:evg_stock_mgmt_admin/widgets/custom_input.dart';
import 'package:evg_stock_mgmt_admin/widgets/inventory_item_card.dart';
import 'package:flutter/material.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text(
                  "Inventory",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const CustomInput(
                      cardWidth: 150,
                      cardHeight: 45,
                      hintText: "",
                      icon: Icons.search,
                      obscureText: false,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        // padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: IconButton(
                          onPressed: () =>
                              {Navigator.pushNamed(context, '/add_inventory')},
                          icon: const Icon(Icons.add_circle_outline_outlined),
                        ),
                      ),
                      // filter dropdown
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        // padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.filter_alt_outlined),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Wrap(
                children: [
                  InventoryItemCard(
                    itemName: "Item Name 1",
                    itemId: "#20",
                    price: "202,300 ETB ",
                  ),
                  InventoryItemCard(
                    itemName: "Item Name 2",
                    itemId: "#21",
                    price: "150,000 ETB",
                  ),
                  InventoryItemCard(
                    itemName: "Item Name 3",
                    itemId: "#22",
                    price: "100,000 ETB",
                  ),
                  InventoryItemCard(
                    itemName: "Item Name 4",
                    itemId: "#23",
                    price: "75,000 ETB",
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
