import 'package:country_picker/country_picker.dart';
import 'package:favourite_application/helper/text_style_helper.dart';
import 'package:favourite_application/screens/verification/verification_code.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    double deviceH = MediaQuery.of(context).size.height / 1000;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
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
              SizedBox(
                height: 5,
              ),
              Text(
                "Please confirm your country code and enter your phone number",
                textAlign: TextAlign.center,
                style: TextStyleHelper.getBodyLarge(context)!.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(
                height: deviceH * 50,
              ),
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
                          borderRadius: BorderRadius.circular(10)
                        ),
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
              SizedBox(
                height: deviceH * 50,
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
                          builder: (context) => VerificationCode()
                          // CreatePasswordPage(),
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
    );
  }
}
