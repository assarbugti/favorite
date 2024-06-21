import 'package:favourite_application/helper/icon_data.dart';
import 'package:favourite_application/helper/text_style_helper.dart';
import 'package:favourite_application/screens/notification_screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Find your Favourite',
            prefixIcon: IconButton(
                icon: SvgPicture.asset("assets/icon/Search.svg"),
                onPressed: null),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(500),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NotificationPage(),
                      ),
                    );
                  },
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
                        minWidth: 170.0,
                        minHeight: 45.0,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Popular',
                        style: TextStyleHelper.getTitleMedium(context)!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
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
}
