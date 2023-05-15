import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:what_the_call/models/language.dart';
import 'models/record.dart';
import 'helpers/constants.dart';
import 'helpers/url_launcher.dart';

// 1
class DetailPage extends StatelessWidget {
  final Record record;
  // 2
  const DetailPage({Key? key, required this.record}) : super(key: key);

  PreferredSizeWidget _buildBar(BuildContext context, String title) {
    return AppBar(
      elevation: 0.1,
      backgroundColor: appDarkGreyColor,
      centerTitle: true,
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).popUntil(
              (Route<dynamic> route) {
                if (route.settings.name != null) {
                  log(route.settings.name!);
                  return route.settings.name! == "Home Page";
                }
                return false;
              },
            );
          },
          icon: const Icon(
            Icons.home,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context, record.name),
      body: ListView(
        children: [
          Hero(
            tag: "avatar_" + record.name,
            child: Image.network(record.photo),
          ),
          GestureDetector(
            onTap: () {
              URLLauncher().launchURL(record.url);
            },
            child: Container(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "${Language.of(context).name}: ${record.name}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "${Language.of(context).address}: ${record.address}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  )),
                  const Icon(Icons.phone, color: Colors.red),
                  Text(record.contact)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
