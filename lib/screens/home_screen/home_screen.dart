import 'package:favourite_application/helper/icon_data.dart';
import 'package:favourite_application/models/influencers_model.dart';
import 'package:favourite_application/screens/chat_screen/chat_screen.dart';
import 'package:favourite_application/screens/group_descripation/group_descripation.dart';
import 'package:favourite_application/screens/setting_page/setting_page.dart';
import 'package:favourite_application/screens/term_condication/term_conditicion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helper/text_style_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(
              appLogoIcon,
              height: 100,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChatScreen(),
                ),
              );
            },
            icon: Badge(
              child: Icon(
                Icons.notifications_none_rounded,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ListTile(
          //   title: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SvgPicture.asset(
          //         appLogoIcon,
          //         height: 80,
          //       ),
          //     ],
          //   ),
          //   trailing: IconButton(
          //     onPressed: () {},
          //     icon: Badge(
          //       child: Icon(
          //         Icons.notifications_none_rounded,
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Welcome Bss,',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Find your Favourite',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => GroupDescripation(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        child: Text(
                          'Popular',
                          style: TextStyleHelper.getTitleSmall(context)!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TermsAndPoliciesScreen(),
                            ),
                          );
                          // GroupDescripation
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Trending',
                          style: TextStyleHelper.getTitleSmall(context)!
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Is someone your Favourite?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Top 05 influencers of Favourite',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: influencersList.map((influencer) {
                      return InfluencersCard(
                        influencersModels: influencer,
                        vertically: false,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Scroll and Get your Favourite',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '2 Influencers are here',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: influencersList.map((influencer) {
                    return InfluencersCard(
                      influencersModels: influencer,
                      vertically: true,
                    );
                  }).toList(),
                ) // InfluencerCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfluencersCard extends StatelessWidget {
  final bool vertically;
  final InfluencersModels influencersModels;
  const InfluencersCard(
      {super.key, required this.influencersModels, required this.vertically});

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    return Container(
      width: vertically ? deviceW : 220,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            // color: Color(0xffA22447).withOpacity(.05),
            offset: Offset(0, 0),
            blurRadius: 20,
            spreadRadius: 3,
          ),
        ],
      ),
      margin: EdgeInsets.only(right: 5),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                'https://ih1.redbubble.net/image.4621767024.5600/raf,360x360,075,t,fafafa:ca443f4786.jpg',
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    influencersModels.influencerName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  SvgPicture.asset(verifiedIcon),
                  // Icon(Icons.verified, color: Colors.blue, size: 16),
                  Spacer(),
                  Text(influencersModels.influencerFan),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.favorite, color: Colors.white),
                  label: Text(
                    'Favourite',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
