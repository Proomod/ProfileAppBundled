import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pramodpro/homepage/widgets/profile_text.dart';
import 'package:url_launcher/url_launcher.dart';

import 'info_card.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({Key? key, required ScrollController scrollController})
      : _scrollController = scrollController,
        super(key: key);
  final ScrollController _scrollController;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(),
      child: ListView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: <Widget>[
          ListTile(
            title: Center(
              child: Text(
                'About me',
                style: GoogleFonts.fredokaOne(
                    textStyle: const TextStyle(
                  fontSize: 22.0,
                )),
              ),
            ),
          ),
          ListBody(
            children: [
              Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.deepOrange,
                    child:
                        ClipOval(child: Image.asset('images/portfolioPic.png')),
                  ),
                  const SizedBox(height: 10.0),
                  const ProfileText(text: 'Pramod Bhusal'),
                  const ProfileText(text: 'Mobile Developer'),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        ProfileText(text: 'Age:23'),
                        ProfileText(text: '9861657210'),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          const ContactMe(),
          const Align(
            alignment: Alignment.bottomCenter,
            child: FollowMe(),
          ),
        ],
      ),
    );
  }
}

class ContactMe extends StatefulWidget {
  const ContactMe({Key? key}) : super(key: key);

  @override
  _ContactMeState createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Contact me',
                style: GoogleFonts.fredokaOne(
                    textStyle: const TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                )),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final Uri params = Uri(
                scheme: 'mailto',
                path: 'bhusalpramod456@gmail.com',
                query:
                    'body=Sent from pramodProfileApp', //add subject and body here
              );

              final String url = params.toString();
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: const InfoCard(
              icon: Icon(Icons.mail),
              information: 'bhusalpramod456@gmail.com',
            ),
          ),
          GestureDetector(
            onTap: () async {
              _launchInBrowser('https://bhusalpramod.com.np');
            },
            child: const InfoCard(
              icon: Icon(Icons.public),
              information: 'bhusalpramod.com.np',
            ),
          ),
          GestureDetector(
            onTap: () async {
              _launchInBrowser('https://github.com/proomod');
            },
            child: const InfoCard(
              icon: Icon(Icons.public),
              information: 'github.com/proomod',
            ),
          ),
          GestureDetector(
            onTap: () {
              _makePhoneCall('tel:9861657210');
            },
            child: const InfoCard(
              icon: Icon(Icons.phone_android),
              information: '9861657210',
            ),
          )
        ],
      ),
    );
  }
}

class FollowMe extends StatefulWidget {
  const FollowMe({Key? key}) : super(key: key);

  @override
  _FollowMeState createState() => _FollowMeState();
}

class _FollowMeState extends State<FollowMe> {
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 25.0, 8.0, 4.0),
          child: Text(
            'Socials',
            style: GoogleFonts.fredokaOne(
                textStyle: const TextStyle(
              fontSize: 22.0,
              color: Colors.black,
            )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 15,
            width: MediaQuery.of(context).size.width / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    await _launchInBrowser('https://www.facebook.com/pr0mod/');
                  },
                  child: const FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () async =>
                      _launchInBrowser('https://github.com/proomod'),
                  child: const FaIcon(
                    FontAwesomeIcons.github,
                    color: Colors.black,
                  ),
                ),
                // GestureDetector(
                //   onTap: () {},
                //   child: const FaIcon(
                //     FontAwesomeIcons.twitter,
                //     color: Colors.black,
                //   ),
                // ),
                GestureDetector(
                  onTap: () =>
                      _launchInBrowser('https://www.instagram.com/i_promod/'),
                  child: const FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () => _launchInBrowser('https://bhusalpramod.com.np'),
                  child: const Icon(
                    Icons.public,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
