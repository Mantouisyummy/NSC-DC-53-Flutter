/*
 * Copyright (C) 2021 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
  * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';
import 'package:mantou/about.dart';
import 'package:mantou/introduce.dart';
import 'package:mantou/latest_news.dart';

Future<void> main() async {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: SizedBox(
          width: 80.0,
          height: 80.0,
          child: IconButton(
            icon: ImageIcon(
              AssetImage('assets/icons/11.png'),
              color: Color(0xff1D1AC7),
              size: 150.0,
            ),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Logo@1x.png"),
                ),
              ),
            ),
            ListTile(
              title: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: ImageIcon(
                        AssetImage('assets/icons/about1.png'),
                        color: Color(0xff1D1AC7),
                        size: 30.0,
                      ),
                    ),
                    TextSpan(
                      text: '  關 於 ',
                      style: TextStyle(color: Colors.black87, fontSize: 30.0),
                    ),
                    TextSpan(
                      text: '競 賽',
                      style:
                          TextStyle(color: Color(0xffFF7817), fontSize: 30.0),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const About()));
              },
            ),
            ListTile(
              title: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: ImageIcon(
                        AssetImage('assets/icons/latest_news1.png'),
                        color: Color(0xff1D1AC7),
                        size: 30.0,
                      ),
                    ),
                    TextSpan(
                      text: '  最 新 ',
                      style: TextStyle(color: Colors.black87, fontSize: 30.0),
                    ),
                    TextSpan(
                      text: '消 息',
                      style:
                          TextStyle(color: Color(0xffFF7817), fontSize: 30.0),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Latest_News()));
              },
            ),
            ListTile(
              title: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: ImageIcon(
                        AssetImage('assets/icons/introduce1.png'),
                        color: Color(0xff1D1AC7),
                        size: 30.0,
                      ),
                    ),
                    TextSpan(
                      text: '  職 類 ',
                      style: TextStyle(color: Colors.black87, fontSize: 30.0),
                    ),
                    TextSpan(
                      text: '介 紹',
                      style:
                          TextStyle(color: Color(0xffFF7817), fontSize: 30.0),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Introduce()));
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(40),
            child: SizedBox(
              height: 130,
              child: Image.asset(
                'assets/Logo@1x.png',
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Center(
                child: Transform.scale(
                  scale: 1.5,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Latest_News()));
                    },
                    icon: const ImageIcon(
                      AssetImage('assets/icons/latest_news1.png'),
                    ),
                    label: const Text(
                      '最新消息',
                      style: TextStyle(
                          color: Color(0xff1D1AC7),
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
              Center(
                child: Transform.scale(
                  scale: 1.5,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const About()));
                    },
                    icon: const ImageIcon(
                      AssetImage('assets/icons/about1.png'),
                    ),
                    label: const Text(
                      '關於競賽',
                      style: TextStyle(
                          color: Color(0xff1D1AC7),
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
              Center(
                child: Transform.scale(
                  scale: 1.5,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Introduce()));
                    },
                    icon: const ImageIcon(
                      AssetImage('assets/icons/introduce1.png'),
                    ),
                    label: const Text(
                      '職類介紹',
                      style: TextStyle(
                          color: Color(0xff1D1AC7),
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
