import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookingPage extends GetView {
  static const String routeName = '/MyBookingPage';
  const MyBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('My Booking'),
      ),
      body: Column(
        children: [Text('MyBooking')],
      ),
    );
  }
}
