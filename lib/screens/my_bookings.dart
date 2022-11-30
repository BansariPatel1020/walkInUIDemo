import 'package:flutter/material.dart';

class MyBookingsPage extends StatelessWidget {
  const MyBookingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: const Center(
        child: Text('My Bookings'),
      ),
    );
  }
}
