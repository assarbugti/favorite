import 'package:favourite_application/helper/icon_data.dart';
import 'package:favourite_application/helper/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final double coverHeight = 230;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          buildTopPart(),
          buildContactInfo(),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: List.generate(8, (index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    tileColor: Color(0xffF6F7F9),
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                    ),
                    title: Row(
                      children: [
                        Text('FettMounir'),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(verifiedIcon)
                      ],
                    ),
                    subtitle: Text('@Fettouh Mounir'),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContactInfo() {
    return Column(
      children: [
        Text(
          'Bss',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Ggg, India',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: .0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem('1', 'Favourite'),
              _buildStatItem('0', 'Fans'),
              _buildStatItem('0', 'Replies'),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton('Revenue', Colors.blue, Colors.white, RevenueIcon),
            _buildButton('Chatroom', Colors.red, Colors.white, chatRoomIcon),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SvgPicture.asset(globeIcon),
                  SizedBox(width: 8),
                  Icon(Icons.circle, color: Colors.blue, size: 4),
                ],
              ),
              SizedBox(width: 40),
              Row(
                children: [
                  SvgPicture.asset(instaIcon),
                  // Icon(Icons.camera_alt, color: Colors.grey),
                  SizedBox(width: 8),
                  Icon(Icons.circle, color: Colors.grey, size: 4),
                ],
              ),
              SizedBox(width: 40),
              Row(
                children: [
                  SvgPicture.asset(facebookIcon),
                  // Icon(Icons.facebook, color: Colors.grey),
                  SizedBox(width: 8),
                  Icon(Icons.circle, color: Colors.grey, size: 4),
                ],
              ),
              SizedBox(width: 40),
              Icon(Icons.add_circle_outline_rounded, color: Color(0xff8F90A7)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    padding: EdgeInsets.all(0.0),
                  ),
                  child: Ink(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff5151C6),
                          Color(0xff007AFF),
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(80.0),
                      ),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(
                        minWidth: 130.0,
                        minHeight: 40.0,
                      ), // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: Text(
                        'Favourites',
                        style: TextStyleHelper.getTitleMedium(context)!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue)),
                  onPressed: () {},
                  child: Text(
                    "Fans",
                    style: TextStyleHelper.getTitleMedium(context)!
                        .copyWith(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTopPart() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: bottom),
          child: _buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: _buildImage(),
        ),
      ],
    );
  }

  Widget _buildCoverImage() {
    return Image.asset(
      "assets/images/bg_image.png",
      fit: BoxFit.cover,
      height: coverHeight,
      width: double.infinity,
    );
  }

  Widget _buildImage() {
    return CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: profileHeight / 2.2,
        backgroundImage: NetworkImage('https://via.placeholder.com/150'),
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildButton(
      String text, Color bgColor, Color textColor, String iconName) {
    return ElevatedButton.icon(
      icon: SvgPicture.asset(iconName),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: bgColor,
        shape: StadiumBorder(),
      ),
      label: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
