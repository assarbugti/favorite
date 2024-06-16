import 'package:favourite_application/helper/text_style_helper.dart';
import 'package:favourite_application/screens/createPassword/create_password.dart';
import 'package:flutter/material.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  final List<FocusNode> _focusNodes =
      List<FocusNode>.generate(4, (index) => FocusNode());
  final List<TextEditingController> _controllers =
      List<TextEditingController>.generate(
          4, (index) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _nextField({required String value, required int index}) {
    if (value.length == 1) {
      if (index != 3) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
        // Optionally, you can submit the OTP here
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Enter Code",
              style: TextStyleHelper.getTitleLarge(context)!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "We have sent you an SMS with the code\nto +91 6111111113",
            textAlign: TextAlign.center,
            style: TextStyleHelper.getBodyMedium(context)!.copyWith(),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 60,
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(),
                      ),
                    ),
                    onChanged: (value) {
                      _nextField(value: value, index: index);
                    },
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CreatePasswordPage()
                    // CreatePasswordPage(),
                    ),
              );
            },
            child: Text(
              "Reset Code",
              style: Theme.of((context))
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.blue),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
