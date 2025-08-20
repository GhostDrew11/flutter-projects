import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Flutter Layout
// Column( // or Row for horizontal
//   mainAxisAlignment: MainAxisAlignment.center, // justify-content
//   crossAxisAlignment: CrossAxisAlignment.center, // align-items
//   children: [
//     Text('Centered content'),
//   ],
// )

// // Flexible equivalent to flex in React
// Expanded(
//   flex: 1,
//   child: Container(/* content */),
// )

// Common Layout Widgets
// Container (like View with styling)
// Container(
//   width: 200,
//   height: 100,
//   padding: EdgeInsets.all(16),
//   margin: EdgeInsets.symmetric(vertical: 16),
//   decoration: BoxDecoration(
//     color: Colors.blue,
//     borderRadius: BorderRadius.circular(8),
//     boxShadow: [BoxShadow(blurRadius: 4)],
//   ),
//   child: Text('Styled Container'),
// )

//Stack (like position: absolute)
// Stack(
//   children: [
//     Container(width: 100, height:100, color: Colors.red),
//     Positioned(
//       top: 10,
//       left: 10,
//       child: Text('Overlay'),
//     ),
//   ],
// )

// Wrap (like flexWrap)
// Wrap(
//   spacing: 8,
//   runSpacing: 8,
//   children: [
//     Chip(label: Text('Tag 1')),
//     Chip(label: Text('Tag 2')),
//     Chip(label: Text('Tag 3')),
//   ],
// )

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card',
      home: Scaffold(
        appBar: AppBar(title: Text('Profile Card')),
        body: Center(child: ProfileCard()),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        // boxShadow: [
        //   BoxShadow(blurRadius: 10, color: Colors.grey.withOpacity(0.2)),
        // ],
      ),
      child: Card(
        // margin: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'John Doe',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Frontend Developer',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatItem('Posts', '123'),
                  // SizedBox(width: 8),
                  _buildStatItem('Followers', '456'),
                  // SizedBox(width: 8),
                  _buildStatItem('Posts', '789'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildStatItem(String label, String count) {
  return Column(
    children: [
      Text(count, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      Text(label, style: TextStyle(color: Colors.grey[600])),
    ],
  );
}
