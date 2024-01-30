import 'package:flutter/material.dart';
import 'package:mantou/info.dart';
import 'package:mantou/first_screen.dart';

void main() {
  runApp(const Latest_News());
}

class NewsDialog extends StatelessWidget {
  final String title;
  final String date;
  final String content;

  const NewsDialog(
      {super.key,
      required this.title,
      required this.date,
      required this.content});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog.fullscreen(
          backgroundColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Latest_News()),
                  ),
                ),
                title: Text(title),
                centerTitle: true,
                backgroundColor: Colors.orange,
              ),
              Text(
                '發布日期： $date',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
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

class Latest_News extends StatelessWidget {
  const Latest_News({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("最新消息", style: TextStyle(color: Colors.white)),
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
          ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              var item = info[index];
              return GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => NewsDialog(
                          title: item.title,
                          date: item.date,
                          content: item.content));
                },
                child: Card(
                  elevation: 15,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          item.date,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 15.0, left: 7.0),
                          child: Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff1D1AC7),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: info.length,
            itemExtent: 100,
          )
        ],
      ),
    );
  }
}
