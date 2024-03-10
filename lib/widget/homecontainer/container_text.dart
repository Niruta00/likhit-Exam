import 'package:flutter/material.dart';

import '../../const/theme/app_color.dart';

class ContainerText extends StatelessWidget {
  final String title;
  final String body;
  final VoidCallback onTap;

  const ContainerText({
    Key? key,
    required this.title,
    required this.onTap,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var height = media.height;
    double containerWidth = MediaQuery.of(context).size.width * 0.3;

    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: containerWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'exo2',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                body,
                style: TextStyle(
                  fontSize: height * 0.015,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black,
                  fontFamily: 'exo2',
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                // padding: const EdgeInsets.all(8.0),
                padding: EdgeInsets.all(height * 0.007),
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: containerWidth * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.buttonColor
                      // gradient: AppColor.gradient2,
                    ),
                    child: Center(
                      child: Text(
                        'Click Here',
                        style: TextStyle(
                          fontSize: height * 0.015,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'exo2',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
