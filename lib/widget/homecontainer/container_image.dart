import 'package:flutter/material.dart';
import 'package:image_compare_slider/image_compare_slider.dart';
import 'dart:async'; // Import this for Timer

class ContainerImage extends StatefulWidget {
  final String image1;
  final String image2;

  const ContainerImage({Key? key, required this.image1, required this.image2})
      : super(key: key);

  @override
  _ContainerImageState createState() => _ContainerImageState();
}

class _ContainerImageState extends State<ContainerImage> {
  double sliderPosition = 0.5;
  double animationDirection = 0.01; // Variable to track animation direction
  late Timer _timer; // Timer variable

  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is initialized
    _startTimer();
  }

  @override
  void dispose() {
    // Dispose the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  // Method to update the slider position at regular intervals
  void _updateSliderPosition(Timer timer) {
    setState(() {
      // Update the slider position based on the animation direction
      sliderPosition += animationDirection;

      // Ensure the position stays within valid bounds (0 to 1)
      sliderPosition = sliderPosition.clamp(0.0, 1.0);

      // Check if the slider reaches the end (0 or 1)
      if (sliderPosition <= 0.0 || sliderPosition >= 1.0) {
        // Reverse the animation direction
        animationDirection *= -1;
      }
    });
  }

  // Method to start the timer
  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 50), _updateSliderPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          Expanded(
            child: Container(
              // height: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                // color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    // Calculate the new position based on drag
                    sliderPosition +=
                        details.primaryDelta! / context.size!.width;

                    // Ensure the position stays within valid bounds (0 to 1)
                    sliderPosition = sliderPosition.clamp(0.0, 1.0);
                  });
                },
                child: ImageCompareSlider(
                  position: sliderPosition,
                  itemOne: Image(
                    image: AssetImage(widget.image1),
                    fit: BoxFit.fitWidth,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  itemTwo: Image(
                    image: AssetImage(widget.image2),
                    fit: BoxFit.fitWidth,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
