import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController urlController = TextEditingController();
  var shortenLink = '';
  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'URL SHORTNER',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.1,
          right: size.width * 0.1,
          // top:
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Short your URLs here...',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: urlController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Shortened Url : $shortenLink',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    getUrl();
                  },
                  child: const Text(
                    'Click to Short',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    FlutterClipboard.copy(shortenLink);
                  },
                  child: const Text(
                    'Copy to Clipboard',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<String> getUrl() async {
    var url = urlController.text;
    var response = await http.get(
      Uri.parse(
        'https://api.shrtco.de/v2/shorten?url=$url',
      ),
    );
    var jsonData = jsonDecode(response.body);

    setState(() {
      shortenLink = jsonData['result']['short_link'];
    });
    return 'Success';
  }
}
