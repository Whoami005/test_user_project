import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Shimmer.fromColors(
      baseColor: theme.cardColor,
      highlightColor: theme.primaryColor,
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
