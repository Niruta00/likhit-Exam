import 'dart:async';

import 'package:flutter/material.dart';

import '../const/routes/routes.dart';
import '../widget/components/carousel.dart';
import '../widget/homecontainer/homecontainer.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _animationController;
  late Timer _timer;
  double _sliderValue = 0.5;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Adjust duration as needed
    )..repeat(reverse: true);

    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      // Move the slider automatically every 5 seconds
      _animationController.forward(from: 0.0);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // drawer: const DrawerSidebar(),
        body: Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     // image: AssetImage(AssetsPath.backgroundImage),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: width * 0.01),
                          InkWell(
                              onTap: () {
                                _scaffoldKey.currentState!.openDrawer();
                              },
                              child: const Icon(Icons.menu,
                                  color: Colors.black)),
                          SizedBox(width: width * 0.04),
                          Text(
                            "Likhit Examination",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: height * 0.03,
                              fontFamily: "Exo 2",
                            ),
                          ),
                        ],
                      ),
                 
                    ],
                  ),
                ),
              
                Padding(
                  padding: EdgeInsets.all(width * 0.02),
                  child: Stack(
                    children: [
                      const Carousel(),
                     
             
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                HomeContainer(
                  color: Colors.white.withOpacity(0.08),
                  isReversed: true,
                  image1: "assets/images/open-book.png",
                  image2: "assets/images/score.png",
                  title: 'प्रश्न उत्तर',
                  body:
                      'निश्चित गरेंछ, यो कुनै प्रश्न र तेस्रोको उत्तर पढ्नका लागि यहाँ ठिक छ। ',
                  onTap: () {
                    // Navigator.pushNamed(context, Routes.inhanceImage);
                  },
                ),
                HomeContainer(
                  color: Colors.white.withOpacity(0.08),
                  isReversed: false,
                  image1: 'assets/images/score.png',
                  image2: 'assets/images/open-book.png',
                  title: 'परीक्षा',
                  body:
                      'प्रश्न पढेर सही उत्तर चयन गर्नुहोस्।" यो अर्थात, प्रश्नहरू पढेपछि सही उत्तरहरू छनौट गर्नुहोस्। ',
                  onTap: () {
                    Navigator.pushNamed(context, Routes.choosesets);
                  },
                ),
                HomeContainer(
                  color: Colors.black,
                  isReversed: true,
                  image1: "assets/images/traffic-light.png",
                  image2: "assets/images/traffic-light.png",
                  title: 'ट्राफिक चिन्ह',
                  body:
                      'ट्राफिक नियम पालन गरौं, सधैं सचेत रहौं, जीवनमा सुरक्षित गरौं, यातायात संकेतहरू लागू गरौं।',
                  onTap: () {
                    Navigator.pushNamed(context, Routes.trafficsign);
                  },
                ),
                HomeContainer(
                  color: Colors.black,
                  isReversed: false,
                  image1: "assets/images/cone.png",
                  image2: "assets/images/license.png",
                  title: 'ड्राइभिङ सेन्टर',
                  body:
                      "Convert photos into lively, artistic cartoons with this dynamic image transformation tool",
                  onTap: () {
                    // Navigator.pushNamed(context, Routes.cartoonConverter);
                  },
                ),
                HomeContainer(
                  color: Colors.white.withOpacity(0.07999999821186066),
                  isReversed: true,
                  image1: "assets/images/info.png",
                  image2: "assets/images/info.png",
                  title: 'थप जानकारी',
                  body:
                      'थाप जानकारीको लागि यहाँ तिच्नुहोस्।',
                  onTap: () {
                    Navigator.pushNamed(context, Routes.newws);
                  },
                ),
                HomeContainer(
                  color: Colors.black,
                  isReversed: false,
                  image1: "assets/images/license.png",
                  image2: "assets/images/cone.png",
                  title: 'ट्रेल दिनुहोस्',
                  body:
                      'sdftgyhujik',
                  onTap: () {
                    // Navigator.pushNamed(context, Routes.sketchImage);
                  },
                ),
                // HomeContainer(
                //   color: Colors.white.withOpacity(0.07999999821186066),
                //   isReversed: true,
                //   image1: "assets/image/restore1.jpg",
                //   image2: "assets/image/restore2.png",
                //   title: 'Restore Old Image',
                //   body:
                //       'Revive and enhance vintage photos with this remarkable tool for restoring old images',
                //   onTap: () {
                //     // Navigator.pushNamed(context, Routes.restoreImage);
                //   },
                // ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
