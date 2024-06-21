import 'package:favourite_application/helper/text_style_helper.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notification'),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // Handle more options press
              },
            ),
          ],
          bottom: TabBar(
            labelStyle: TextStyleHelper.getBodyLarge(context)!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: "General"),
              Tab(text: "Friends"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      NotificationTile(
                        avatarUrl: 'assets/avatar1.png',
                        name: 'Arpit Kumar Singh',
                        message:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        time: '1m ago',
                        unreadCount: 2,
                      ),
                      NotificationTile(
                        avatarUrl: 'assets/avatar2.png',
                        name: 'Bss',
                        message:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        time: '1m ago',
                        unreadCount: 0,
                      ),
                      NotificationTile(
                        avatarUrl: 'assets/avatar3.png',
                        name: 'Bss',
                        message:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        time: '10 Hrs ago',
                        unreadCount: 0,
                      ),
                      NotificationTile(
                        avatarUrl: 'assets/avatar4.png',
                        name: 'Bss',
                        message:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        time: '15 Hrs ago',
                        unreadCount: 0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      NotificationTile(
                        avatarUrl: 'assets/avatar1.png',
                        name: 'Arpit Kumar Singh',
                        message:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        time: '1m ago',
                        unreadCount: 2,
                      ),
                      NotificationTile(
                        avatarUrl: 'assets/avatar2.png',
                        name: 'Bss',
                        message:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        time: '1m ago',
                        unreadCount: 0,
                      ),
                      NotificationTile(
                        avatarUrl: 'assets/avatar3.png',
                        name: 'Bss',
                        message:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        time: '10 Hrs ago',
                        unreadCount: 0,
                      ),
                      NotificationTile(
                        avatarUrl: 'assets/avatar4.png',
                        name: 'Bss',
                        message:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        time: '15 Hrs ago',
                        unreadCount: 0,
                      ),
                    ],
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

class NotificationTile extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String message;
  final String time;
  final int unreadCount;

  NotificationTile({
    required this.avatarUrl,
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(avatarUrl),
            radius: 24,
          ),
          if (unreadCount > 0)
            Positioned(
              right: 0,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$unreadCount',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        name,
        style: TextStyleHelper.getBodyLarge(context)!.copyWith(
          fontWeight: FontWeight.bold
        ),
      ),
      subtitle: Text(message),
      trailing: Text(time),
    );
  }
}
