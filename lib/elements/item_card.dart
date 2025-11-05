import 'package:flutter/material.dart';
import 'package:grocery_app/app%20configs/app_Config.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({super.key});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 248,
      width: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade400)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 100,
                width: 150,
                child: Image.asset(
                  "assets/Images/product_images/Vector.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Spacer(),
            Text(
              "Organic Bananas",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
            ),
            Text(
              "7pcs, Priceg",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.grey),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$4.99",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: primaryColor),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
