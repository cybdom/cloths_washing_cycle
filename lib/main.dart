import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff4c4eea),
          body: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: double.infinity,
                      padding: EdgeInsets.all(15.0),
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(261, 51),
                          topRight: Radius.elliptical(261, 51),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                heightFactor: 1.5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircularProgress(),
                    SizedBox(
                      height: 21,
                    ),
                    Instructions(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircularProgress extends StatelessWidget {
  final int progress = 61;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 151,
          height: 151,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(0, 1),
                blurRadius: 9.0,
              ),
            ],
          ),
          padding: EdgeInsets.all(11.0),
          child: CustomPaint(
            foregroundPainter: new MyPainter(
              completeColor: Colors.cyan,
              completePercent: progress.toDouble(),
              width: 9.0,
            ),
            child: Center(
              child: Container(
                margin: EdgeInsets.all(17),
                child: FittedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Hamper",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 31,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 11),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "$progress",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 61,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "%",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 31,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 11),
                      Text(
                        "FULL",
                        style: TextStyle(
                          color: Colors.cyan,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 21,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 11,
              width: 11,
              margin: EdgeInsets.only(right: 11.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
            ),
            Container(
              height: 11,
              width: 11,
              margin: EdgeInsets.only(right: 11.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
            ),
            Container(
              height: 11,
              width: 11,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;
  MyPainter({
    this.lineColor,
    this.completeColor,
    this.completePercent,
    this.width,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    double arcAngle = 2 * pi * (completePercent / 100);
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radius), pi / 2,
        arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Instructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 11,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Folding Instructions",
            style: TextStyle(
              color: Colors.black54,
              fontSize: Theme.of(context).textTheme.title.fontSize,
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 11.0),
                height: 230,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400],
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (context, id) {
                    return ListTile(
                      title: Text("Match Socks"),
                      leading: Icon(Icons.check, color: Colors.green),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_drop_down),
                        onPressed: () {},
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 51,
                right: 51,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 9.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Start Cycle",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.white,)
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
