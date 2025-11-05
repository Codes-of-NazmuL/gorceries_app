import 'package:flutter/material.dart';
import 'package:grocery_app/app%20configs/app_Config.dart';

class ItemCard extends StatefulWidget {
  final String? image;
  final String name;
  final String? shortDsc;
  final String Price;

  const ItemCard(
      {super.key,
      this.image,
      required this.name,
      required this.shortDsc,
      required this.Price});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7.5),
      height: 250,
      width: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.withOpacity(.5))),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2,
            ),
            Center(
              child: SizedBox(
                height: 100,
                width: 135,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.network(
                    widget.image ??
                        "https://thumbs.dreamstime.com/b/image-not-available-icon-image-not-available-icon-set-default-missing-photo-stock-vector-symbol-black-filled-330249482.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              widget.name,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
            ),
            Text(
              widget.shortDsc ?? "",
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
                  "\$${widget.Price}",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
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
