import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUserDetailsWidget extends StatelessWidget {
  const ShimmerUserDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).cardColor,
      highlightColor: Theme.of(context).primaryColor,
      child: const Column(
        children: [
          SizedBox(
            height: 350,
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: SizedBox(
              height: 20,
              width: double.infinity,
              child: Card(),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: SizedBox(
              height: 17,
              width: double.infinity,
              child: Card(),
            ),
          ),
        ],
      ),
    );
  }
}
