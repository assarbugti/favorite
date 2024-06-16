import 'package:favourite_application/helper/icon_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isPasscodeEnabled = true;
  bool _isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            'Account',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Card(
            elevation: 0,
            color: Color(0xfff4f4f7),
            child: Column(
              children: [
                ListTile(
                  leading: SvgPicture.asset(userIcon),
                  title: Text('Edit profile'),
                  onTap: () {},
                ),
                ListTile(
                  leading: SvgPicture.asset(ChangePassCodeicon),
                  title: Text('Change Passcode'),
                  trailing: Switch(
                    value: _isPasscodeEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isPasscodeEnabled = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  leading: SvgPicture.asset(notificationsicon),
                  title: Text('Notifications'),
                  onTap: () {},
                ),
                ListTile(
                  leading: SvgPicture.asset(privacyIcon),
                  title: Text('Privacy'),
                  onTap: () {},
                ),
                ListTile(
                  leading: SvgPicture.asset(creategroupIcon),
                  //  Icon(FontAwesomeIcons.users),
                  title: Text('Create Group'),
                  onTap: () {},
                ),
                ListTile(
                  leading: SvgPicture.asset(verificationIcon),
                  // Icon(FontAwesomeIcons.checkCircle),
                  title: Text('Verification'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Support & About',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Card(
            elevation: 0,
            color: Color(0xfff4f4f7),
            child: Column(
              children: [
                ListTile(
                  leading: SvgPicture.asset(darkmodeIcon),
                  title: Text('Dark Mode'),
                  trailing: Switch(
                    value: _isDarkModeEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isDarkModeEnabled = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  leading: SvgPicture.asset(helpSupportIcon),
                  // Icon(FontAwesomeIcons.questionCircle),
                  title: Text('Help & Support'),
                  onTap: () {},
                ),
                ListTile(
                  leading: SvgPicture.asset(termPoliciesIcon),
                  title: Text('Terms and Policies'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Actions',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Card(
            elevation: 0,
            color: Color(0xfff4f4f7),
            child: Column(
              children: [
                ListTile(
                  leading: SvgPicture.asset(reportProblemIcon),
                  title: Text('Report a problem'),
                  onTap: () {},
                ),
                ListTile(
                  leading: SvgPicture.asset(inviteFriendIcon),
                  title: Text('Invite Friends'),
                  onTap: () {},
                ),
                ListTile(
                  leading: SvgPicture.asset(logOutIcon),
                  title: Text('Log out'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
