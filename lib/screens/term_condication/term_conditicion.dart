import 'package:flutter/material.dart';

class TermsAndPoliciesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Terms and Policies'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Section(
            title: 'Legal and Policies',
            items: [
              'Privacy Policy',
              'Terms of Use',
              'Community Guidelines',
              'Content use Policy',
              'Influencer Agreement',
              'Membership Agreement',
            ],
          ),
          Section(
            title: 'Payments and Refund',
            items: [
              'Payment Terms and Conditions',
              'Cancellation and Refund',
            ],
          ),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final List<String> items;

  Section({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Card(
          color: Color(0xfff4f4f7),
          elevation: 0,
          margin: EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...items.map((item) {
                return ListTile(
                  title: Text(item),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Handle item tap
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }
}
