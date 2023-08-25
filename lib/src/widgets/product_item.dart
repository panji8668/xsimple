import 'package:flutter/material.dart';
import 'package:isimple/src/models/isimpleproduct.dart';

class PrductItem extends StatelessWidget {
  final IProduct product;
  final Function(IProduct) ontap;
  const PrductItem({super.key, required this.product, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap(product),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: const BorderRadius.all(
              Radius.circular(8) //                 <--- border radius here
              ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
                      child: Text(product.name,
                          style: const TextStyle(fontWeight: FontWeight.bold))
                  ),
                          Container(
                      margin:
                          const EdgeInsets.only(right: 8, top: 4, bottom: 4),
                      child: Text(product.detailBenefit,
                          style: const TextStyle(color: Colors.black87))),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  product.amount,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.deepOrange),
                ),
                const Icon(Icons.chevron_right)
              ],
            )
          ],
        ),
      ),
    );
  }
}
