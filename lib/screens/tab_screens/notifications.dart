import 'package:flutter/material.dart';
import 'package:mollet/model/services/auth_service.dart';
import 'package:mollet/utils/colors.dart';
import 'package:mollet/widgets/allWidgets.dart';

// import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class InboxScreen extends StatefulWidget {
  InboxScreen({Key key}) : super(key: key);

  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return emptyScreen(
      "assets/images/noInbox.svg",
      "No Notifications",
      "Messages, promotions and general information from stores, pet news and the Pet Shop team will show up here.",
    );
  }
}

class MessageHandler extends StatefulWidget {
  MessageHandler({Key key}) : super(key: key);

  @override
  _MessageHandlerState createState() => _MessageHandlerState();
}

class _MessageHandlerState extends State<MessageHandler> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _fcm = FirebaseMessaging();

  @override
  void initState() {
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage $message");
        showSimpleSnack(
          message['notification']['title'],
          Icons.notifications,
          MColors.primaryPurple,
          _scaffoldKey,
        );
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch-= $message");
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
