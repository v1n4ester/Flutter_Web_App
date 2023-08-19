import 'package:flutter_web/widgets/responsive.dart';
import 'package:flutter/material.dart';

class FeaturedHeading extends StatelessWidget {
  const FeaturedHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Row(
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Featured',
                      style: TextStyle(
                          fontSize: 36,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF077bd7)),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Clue of the wooden cottage',
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
            ],
          )
          : Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Featured',
                  style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF077bd7)),
                ),
                Expanded(
                  child: Text(
                    'Clue of the wooden cottage',
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
    );
  }
}
