
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

showAppLoading(BuildContext context){
  ListView.builder(
        itemCount: 10, // Replace with your actual item count
        itemBuilder: (BuildContext context, int index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
              ),
              title: Container(
                color: Colors.white,
                height: 16,
              ),
              subtitle: Container(
                color: Colors.white,
                height: 12,
              ),
            ),
          );
        },
      );
}