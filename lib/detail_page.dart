import 'package:flutter/material.dart';
import 'models/record.dart';
import 'helpers/constants.dart';

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
              // TODO: URLLauncher....
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
                          "Name: " + record.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "Address: " + record.address,
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
