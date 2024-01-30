import 'package:flutter/material.dart';
import 'package:mantou/first_screen.dart';
import 'package:mantou/info.dart';

void main() {
  runApp(const Introduce());
}

class IntroduceDialog extends StatelessWidget {
  final int number;
  final String name;
  final String description;
  final String competition;
  final String future;

  const IntroduceDialog(
      {super.key,
      required this.number,
      required this.name,
      required this.description,
      required this.competition,
      required this.future});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog.fullscreen(
          backgroundColor: Colors.white,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/background.png'),
                      fit: BoxFit.cover),
                ),
              ),
              SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AppBar(
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back, color: Color(0xff1D1AC7)),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Introduce()),
                        ),
                      ),
                      title: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: number.toString().padLeft(2, '0'),
                            style: TextStyle(
                                color: Color(0xffFF7817),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          TextSpan(
                            text: "  " + name,
                            style: TextStyle(
                                color: Color(0xff1D1AC7),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ]),
                      ),
                      centerTitle: true,
                      backgroundColor: Colors.transparent,
                    ),
                    const SizedBox(height: 25),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(26),
                              child: Transform.scale(
                                scale: 0.8,
                                child: Image.asset(
                                  'assets/${number.toString().padLeft(2, '0')}.png',
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "資訊與通訊技術\n\n",
                                    style: TextStyle(
                                      color: Color(0xff1D1AC7),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "職類介紹\n",
                                    style: TextStyle(
                                      color: Color(0xff1D1AC7),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  TextSpan(
                                    text: description,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "競賽方式\n",
                                    style: TextStyle(
                                      color: Color(0xff1D1AC7),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  TextSpan(
                                    text: competition,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "未來發展\n",
                                      style: TextStyle(
                                        color: Color(0xff1D1AC7),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    TextSpan(
                                      text: future,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });

    return Container();
  }
}

class Introduce extends StatelessWidget {
  const Introduce({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("職類介紹", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff1D1AC7),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage())),
        ),
        toolbarHeight: 60.0,
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
          Center(
            child: Row(
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(12),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2.0,
                    ),
                    itemCount: 7, // 根據您的需求設置Card的數量
                    itemBuilder: (BuildContext context, int index) {
                      var item = introduce_info[index];
                      return GestureDetector(
                        onTap: () {
                          // 點擊事件處理程式碼
                          showDialog(
                            context: context,
                            builder: (_) => IntroduceDialog(
                                number: item.number,
                                name: item.name,
                                description: item.description,
                                competition: item.competition,
                                future: item.future),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Card(
                            elevation: 15,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Image.asset(
                                        'assets/${item.number.toString().padLeft(2, '0')}.png'),
                                  ),
                                ),
                                SizedBox(height: 7),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: item.number
                                                .toString()
                                                .padLeft(2, '0'),
                                            style: TextStyle(
                                              color: Color(0xffFF7817),
                                              fontSize: 25.0,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '  ' + item.name,
                                            style: TextStyle(
                                              color: Color(0xff1D1AC7),
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
