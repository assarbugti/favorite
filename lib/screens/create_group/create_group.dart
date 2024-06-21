import 'package:flutter/material.dart';

class CreateGroupPage extends StatefulWidget {
  @override
  _CreateGroupPageState createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  int _selectedLimit = 500;
  String _selectedPrice = "\$2499";
  String _category = "Choose Category";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Create Group'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Replace with your image URL
              child: IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Chatroom Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Details',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            Text(
              'Select Chatroom Limit and Price',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLimitButton(200),
                _buildLimitButton(500),
                _buildLimitButton(1000),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPriceButton("\$999"),
                _buildPriceButton("\$2499"),
                _buildPriceButton("\$4999"),
              ],
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text(_category),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle category selection
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle create chatroom
              },
              child: Text('Create Chatroom'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLimitButton(int limit) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedLimit = limit;
        });
      },
      child: Text(limit.toString()),
      style: ElevatedButton.styleFrom(
        foregroundColor: _selectedLimit == limit ? Colors.white : Colors.black,
        backgroundColor:
            _selectedLimit == limit ? Colors.blue : Colors.grey[300],
      ),
    );
  }

  Widget _buildPriceButton(String price) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedPrice = price;
        });
      },
      child: Text(price),
      style: ElevatedButton.styleFrom(
        foregroundColor: _selectedPrice == price ? Colors.white : Colors.black,
        backgroundColor:
            _selectedPrice == price ? Colors.blue : Colors.grey[300],
      ),
    );
  }
}
