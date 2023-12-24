import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCardWidget extends StatelessWidget {
  const ShimmerCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).cardColor,
      highlightColor: Theme.of(context).primaryColor,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 130,
              width: 130,
              child: Card(),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  SizedBox(
                    height: 20,
                    width: double.infinity,
                    child: Card(),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    height: 20,
                    width: double.infinity,
                    child: Card(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
