import 'package:favourite_application/helper/text_style_helper.dart';
import 'package:favourite_application/screens/verification/verification_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: SvgPicture.asset("assets/images/onboarding.svg"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Connect easily with your favourites and friends over countries",
                textAlign: TextAlign.center,
                style: TextStyleHelper.getDisplaySmall(context)!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Column(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Terms & Privacy Policy",
                    textAlign: TextAlign.center,
                    style: TextStyleHelper.getTitleLarge(context)!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff007AFF),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => VarificationPhone(),
                          ),
                        );
                      },
                      child: Text(
                        "Continue",
                        style: TextStyleHelper.getTitleLarge(context)!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
