import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class News extends StatelessWidget {
  final bool? isImportant;
  final String? notice;

  const News({
    Key? key,
    this.isImportant,
    this.notice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Material(
          elevation: 2.0,
          borderRadius: BorderRadius.circular(6.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              // Add a border.
              border: Border.all(
                color: isImportant == true
                    ? const Color(0xFFEE6767)
                    : Colors.transparent,
                width: 1.0,
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0, right: 12.0),
                    child: Row(
                      children: [
                   
                        const SizedBox(
                          width: 15.0,
                        ),
                        isImportant == true
                            ? Material(
                                borderRadius: BorderRadius.circular(3.0),
                                color: const Color(0xFFEE6767),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                    vertical: 1.0,
                                  ),
                                  child: Text(
                                    "महत्त्वपूर्ण",
                                    style: GoogleFonts.mukta(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  Text(
                    notice ??
                        '''सूचना: नयाँ सुधारहरू जोडिएको
      
      प्रिय उपयोगकर्ताहरू,
      
      हाम्रो लाइसेन्स तयारी अनुप्रयोगमा नयाँ सुधारहरू थपिएका छन्। यी नयाँ सुधारहरूमा लाइसेन्स परीक्षाका लागि तयारी गर्ने तरिकाहरू, संबंधित नियम र निर्देशनहरू, र अन्य महत्त्वपूर्ण जानकारीहरू शामिल गरिएका छन्।
      
      हाम्रो अनुप्रयोगमा लाइसेन्स परीक्षाका लागि तयारी गर्न र आफ्नो परीक्षाको तयारीमा मद्दत गर्नका लागि धेरै प्रश्नोत्तरी, मॉडल परीक्षाहरू, र विभिन्न अभ्यास सामग्रीहरू उपलब्ध छन्।
      
      हामी यो अनुप्रयोग लेखिने क्रममा नयाँ सुधारहरू र अपडेटहरू थप्न लागेका छौं। तपाईंलाई समेत नियमित अपडेट गर्नका लागि हाम्रो अनुप्रयोगमा नजिकै आउनुहोस्।
      
      हाम्रो अनुप्रयोग प्रयोग गर्नुभएको बाट, तपाईं लाइसेन्स परीक्षा तयारीमा सजिलो र असुविधा रहित अनुभव प्राप्त गर्नुहोस्।
      
      धन्यवाद,
      लाइसेन्स तयारी टोलि
      
      
      ''',
                    style: GoogleFonts.mukta(
                      textStyle: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
