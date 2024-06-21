import 'package:country_picker/country_picker.dart';
import 'package:favourite_application/helper/text_style_helper.dart';
import 'package:favourite_application/screens/verification/verification_code.dart';
import 'package:favourite_application/service/google_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VarificationPhone extends StatefulWidget {
  const VarificationPhone({super.key});

  @override
  State<VarificationPhone> createState() => _VarificationPhoneState();
}

class _VarificationPhoneState extends State<VarificationPhone> {
  TextEditingController? phoneNumber = TextEditingController();
  Country? _selectedCountry = Country(
    phoneCode: '91',
    countryCode: 'IN',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'India',
    example: '9123456789',
    displayName: 'India',
    displayNameNoCountryCode: 'India',
    e164Key: '91-IN-0',
  );

  Map<String, dynamic>? _youtubeData;

  void _handleSignIn() async {
    SignInProvider signInProvider = Provider.of(context, listen: false);
    try {
      final user = await signInProvider.signInWithGoogle();
      if (user != null) {
        final data = await signInProvider.fetchYoutubeData(await user.getIdToken());
        setState(() {
          _youtubeData = data;
        });
        print(_youtubeData);
      }
    } catch (error) {
      print(error);
    }
  }

  bool isVerifiedChannel(Map<String, dynamic> channelData) {
    final customUrl = channelData['snippet']['customUrl'];
    final subscriberCount = int.tryParse(channelData['statistics']['subscriberCount'] ?? '0') ?? 0;
    final publishedAt = DateTime.tryParse(channelData['snippet']['publishedAt'] ?? '') ?? DateTime.now();
    final videoCount = int.tryParse(channelData['statistics']['videoCount'] ?? '0') ?? 0;
    final channelAge = DateTime.now().difference(publishedAt).inDays;

    // Enhanced Heuristic for Verification
    bool hasCustomUrl = customUrl != null;
    bool hasSignificantSubscribers = subscriberCount >= 100000;
    bool isOlderThanOneYear = channelAge >= 365;
    bool hasVideoCount = videoCount >= 50;

    return hasCustomUrl && hasSignificantSubscribers && isOlderThanOneYear && hasVideoCount;
  }

  @override
  Widget build(BuildContext context) {
    double deviceH = MediaQuery.of(context).size.height / 1000;
    SignInProvider signInProvider = Provider.of(context);

    bool verifiedStatus = false;
    if (signInProvider.datas != null) {
      var channelData = signInProvider.datas!['items'][0];
      verifiedStatus = isVerifiedChannel(channelData);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: signInProvider.datas != null
          ? Center(
              child: Column(
                children: [
                  Text("User data for test "),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(signInProvider.datas!['items'][0]['snippet']['thumbnails']['high']['url']),
                  ),
                  Text('Verification Status: ${verifiedStatus ? 'Verified' : 'Not Verified'}'), // Display verification status
                  Text("Channel name : ${signInProvider.datas!['items'][0]['snippet']['title']}"),
                  Text("Channel Id :   ${signInProvider.datas!['items'][0]['id']}"),
                  Text("Subscriber Count : ${signInProvider.datas!['items'][0]['statistics']['subscriberCount']}"),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Enter Your Phone Number",
                      style: TextStyleHelper.getTitleLarge(context)!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Please confirm your country code and enter your phone number",
                      textAlign: TextAlign.center,
                      style: TextStyleHelper.getBodyLarge(context)!.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: deviceH * 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode: false,
                                onSelect: (Country country) {
                                  setState(() {
                                    _selectedCountry = country;
                                  });
                                },
                              );
                            },
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Color(0xffF7F7FC),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 20,
                                ),
                                child: Text(
                                  '${_selectedCountry!.flagEmoji}+${_selectedCountry!.phoneCode}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: phoneNumber,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF7F7FC),
                                hintText: "Phone Number",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: deviceH * 50),
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
                              MaterialPageRoute(builder: (context) => VerificationCode()),
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
                    SizedBox(height: deviceH * 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        height: 55,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff007AFF),
                          ),
                          onPressed: _handleSignIn,
                          child: Text(
                            "Google Auth",
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
    );
  }
}
