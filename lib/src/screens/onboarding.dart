import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_with_provider/src/models/onboarding_model.dart';
import 'package:ui_with_provider/src/widgets/onboarding_builder.dart';
import '../constants/colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    OnboardingContent onboardingContent = OnboardingContent();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            color: Colors.transparent,
          ),
          Image.asset('assets/images/cat.jpg'),
          Positioned(
            top: height * 0.6,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.37,
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  onboardingIndicator(
                    onboardingContent,
                    currentPageIndex,
                    width,
                    height,
                  ),
                  Expanded(
                    child: PageView.builder(
                      itemCount: onboardingContent.onboardingPages.length,
                      itemBuilder: (context, index) {
                        return buildOnboardingPage(
                          onboardingContent.onboardingPages[index],
                          width,
                          height,
                        );
                      },
                      onPageChanged: (index) {
                        setState(() {
                          currentPageIndex = index;
                        });
                      },
                    ),
                  ),
                  if (currentPageIndex == 2)
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05,
                      ),
                      child: SizedBox(
                        width: width,
                        height: height * 0.06,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/navbar');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme,
                            elevation: 1.0,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Get Started!',
                            style: GoogleFonts.inter(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.w700,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget onboardingIndicator(OnboardingContent onboardingContent,
    int currentPageIndex, double width, double height) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for (int i = 0; i < onboardingContent.onboardingPages.length; i++)
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.015,
            horizontal: width * 0.01,
          ),
          child: SvgPicture.asset(
            i == currentPageIndex
                ? 'assets/icons/scroll-circle-filled.svg'
                : 'assets/icons/scroll-circle.svg',
            height: 12.0,
            width: 12.0,
            colorFilter: ColorFilter.mode(theme, BlendMode.srcIn),
          ),
        ),
    ],
  );
}
