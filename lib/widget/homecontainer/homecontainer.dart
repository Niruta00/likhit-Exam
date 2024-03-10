import 'package:flutter/material.dart';

import 'container_image.dart';
import 'container_text.dart';

// import '../../core/theme/app_color.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(
      {super.key,
      this.image1,
      this.image2,
      required this.title,
      required this.body,
      required this.onTap,
      required this.color,
      required this.isReversed});
  final String? image1;
  final String? image2;

  final String title;
  final String body;
  final Color color;

  final VoidCallback onTap;
  final bool isReversed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.228,
        // width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          
          // border: Border.all(width: 1,color: AppColor.black),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          // color: Colors.white.withOpacity(0.07999999821186066),
              color: Colors.white.withOpacity(0.95),
    boxShadow: [
      BoxShadow(
      color: Colors.white.withOpacity(0.966),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 2), // Offset of the shadow
      ),
    ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: isReversed
              ? [
                  ContainerText(
                    title: title,
                    onTap: onTap,
                    body: body,
                  ),
                  ContainerImage(
                    image1: image1!,
                    image2: image2!,
                    // image1: image1!
                    // image2:image2!,
                  )
                ].reversed.map((e) => e).toList()
              : [
                  ContainerText(
                    title: title,
                    onTap: onTap,
                    body: body,
                  ),
                  ContainerImage(
                  image1: image1!,
                    image2: image2!,
                  )
                ],
        ),
      ),
    );
  }
}
