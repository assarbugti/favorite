import 'package:flutter/material.dart';

class RevenueStatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Revenue Statics'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Earning and Engagement Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text('Fans & Revenue'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ToggleButtons(
                  borderRadius: BorderRadius.circular(20),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Fans'),
                    ),
                  ],
                  isSelected: [true],
                ),
                ToggleButtons(
                  borderRadius: BorderRadius.circular(20),
                  children: <Widget>[
                    Icon(Icons.show_chart),
                    Icon(Icons.pie_chart),
                  ],
                  isSelected: [true, false],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              '500 Fans',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              height: 200,
              width: double.infinity,
              child: BarChart(),
            ),
            SizedBox(height: 16),
            ToggleButtons(
              borderRadius: BorderRadius.circular(20),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Monthly'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Yearly'),
                ),
              ],
              isSelected: [true, false],
            ),
            SizedBox(height: 16),
            Text('Transactions'),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                        // backgroundImage:
                        //     AssetImage('https://example.com/path_to_image.jpg'),
                        ),
                    title: Text('User Name'),
                    subtitle: Text('Number'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('\$999'),
                        Text('05-03-2024'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BarChartPainter(),
    );
  }
}

class BarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final barWidth = size.width / 14;
    final barHeight = size.height / 150;

    final bars = [
      Bar(0, 100),
      Bar(1, 80),
      Bar(2, 50),
      Bar(3, 120),
      Bar(4, 70),
      Bar(5, 90),
      Bar(6, 60),
    ];

    for (var bar in bars) {
      final left = bar.index * 2 * barWidth;
      final top = size.height - (bar.value * barHeight);
      final right = left + barWidth;
      final bottom = size.height;

      canvas.drawRect(Rect.fromLTRB(left, top, right, bottom), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class Bar {
  final int index;
  final int value;

  Bar(this.index, this.value);
}
