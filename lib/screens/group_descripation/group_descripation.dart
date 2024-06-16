import 'package:favourite_application/helper/text_style_helper.dart';
import 'package:flutter/material.dart';

class GroupDescripation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('MounirFans'),
      //   actions: [
      // IconButton(
      //   icon: Icon(Icons.more_vert),
      //   onPressed: () {},
      // ),
      //   ],
      // ),
      body: Column(
        children: [
          Image.network(
            'https://via.placeholder.com/300',
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackButton(
                color: Colors.black,
              ),
              Text(
                "MounirFans",
                style: TextStyleHelper.getTitleLarge(context)!
                    .copyWith(color: Colors.black),
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.info_outline),
              title: Text(
                'Lorem Ipsum Lorem IpsumLorem IpsumLorem IpsumLorem Ipsum',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SwitchListTile(
            secondary: Icon(Icons.notifications_active_outlined),
            value: true,
            onChanged: (bool value) {},
            title: Text('Notifications'),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xffEDEDED)),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.group,
                      color: Colors.blue,
                    ),
                    title: Text(
                      "12 Peoples",
                      style: TextStyleHelper.getTitleSmall(context)!
                          .copyWith(color: Colors.black),
                    ),
                    trailing: Wrap(
                      children: [
                         IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person_add_alt_1,
                            color: Colors.blue,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search_outlined,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Color(0xffEAEAEA),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        _buildUserTile('Adina Nurrahma', 'Admin', context),
                        _buildUserTile('Mounir', 'Admin', context),
                        _buildUserTile('Marvin Robertson', '', context),
                        _buildUserTile('Gregory Robertson', '', context),
                        _buildUserTile('Samuel Witnessa', '', context),
                        _buildUserTile('Bambang Wijayanto', '', context),
                        _buildUserTile('Sururi Mandatson', '', context),
                        _buildUserTile('Michael Robbin', '', context),
                        _buildUserTile('Jackobs Stewart', '', context),
                        _buildUserTile('Anastasia Redborn', '', context),
                        _buildUserTile('Fuetla Lamalida', '', context),
                        _buildUserTile('Kimini Wildjackson', '', context),
                      ],
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

  Widget _buildUserTile(String name, String role, BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          Icon(Icons.circle, color: Colors.green, size: 12),
        ],
      ),
      title: Text(name),
      // subtitle:
      trailing: role.isNotEmpty
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
              onPressed: () {},
              child: Text(
                role,
                style: TextStyleHelper.getTitleSmall(context)!
                    .copyWith(color: Colors.white),
              ),
            )
          : null,
    );
  }
}
