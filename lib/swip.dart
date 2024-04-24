import 'package:flutter/material.dart';
import 'package:myapp/login.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 150.0),
                      child: Image.asset("images/a.jpg"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(255, 227, 237, 238),
                      ),
                      child: Text(
                        "Consult only with a doctor you trust.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24.0),
                      ),
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 135.0),
                      child: Image.asset("images/b.jpg"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(255, 227, 237, 238),
                      ),
                      child: Text(
                        "find many specialist doctors in one place.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24.0),
                      ),
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 160.0),
                      child: Image.asset("images/c.jpg"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(255, 227, 237, 238),
                      ),
                      child: Text(
                        "connect to our consultation online.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24.0),
                      ),
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(3, (int index) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 80.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Color(0xFF459191) : Colors.grey,
                ),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: Padding(
  padding: EdgeInsets.only(bottom: 720.0, right: 10.0),
  child: TextButton(
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    },
    child: Text(
      'Skip',
      style: TextStyle(
        decoration: TextDecoration.underline,fontSize: 20.0,color: Color(0xFF459191), // Souligner le texte
      ),
    ),
  ),
),

    );
  }
}